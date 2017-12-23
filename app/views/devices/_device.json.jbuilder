json.extract! device, :id, :mac_address, :ip_address, :vendor, :hostname, :notes, :last_seen_at, :created_at, :updated_at
json.url device_url(device, format: :json)
