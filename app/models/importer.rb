class Importer

  # sudo nmap -oX public/nmap_output.xml -sP 192.168.2.*
  # rails runner -e development Importer.new.call

  def call
    import_and_notify
    Log.purge_old_records
  end

  def import_and_notify
    import_from_nmap!
    notify!
  end

  def import_from_nmap!
    nmap_data["nmaprun"]["host"].each do |host|
      device = process_host(host)
      device = update_or_create(device)
      log_entry(device)
    end
  end

  def process_host(host)
    device = process_addresses(host["address"])
    device.hostname = get_hostname(host["hostnames"], device)
    return device
  end

  def process_addresses(addresses)
    device = Device.new
    addresses.each do |address|
      next if address.is_a?(Array)
      case address["addrtype"]
      when "ipv4"
        device.ip_address = address["addr"]
      when "mac"
        device.mac_address = address["addr"]
        device.vendor = address["vendor"]
      end
    end
    return device
  end

  def get_hostname(hostnames, device)
    if hostnames.present?
      device.hostname = hostnames.first.second["name"]
    else
      device.hostname = nil
    end
  end

  def xml_file
    File.open("public/nmap_output.xml")
  end

  def nmap_data
    Hash.from_xml(xml_file)
  end

  def update_or_create(processed_device)
    device = Device.find_by(mac_address: processed_device.mac_address)
    device ||= Device.new
    device.update_attributes(
      mac_address: processed_device.mac_address,
      ip_address: processed_device.ip_address,
      vendor: processed_device.vendor,
      hostname: processed_device.hostname,
      last_seen_at: Time.now
    )
    return device
  end

  def notify!
    return if devices_to_notify.blank?
    NotificationMailer.notification_email(devices_to_notify).deliver_now
  end

  def devices_to_notify
    Device.where("created_at > ?", Time.now - 5.minutes) +
      Device.where("last_seen_at > ?", Time.now - 5.minutes).where(always_alert: true)
  end

  def log_entry(device)
    Log.create(device: device)
  end

end
