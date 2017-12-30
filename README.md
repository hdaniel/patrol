# Patrol

Ruby on Rails app to track when new devices join your network and send an email notification.

Parses the XML output from [Nmap](https://nmap.org) and saves the entries to a local database.  Intended to run on a Raspberry Pi to monitor the local network and alert when new devices are detected.

To install:

* ...

Setting up a Raspberry Pi:

* [Headless Raspberry Pi Setup](https://hackernoon.com/raspberry-pi-headless-install-462ccabd75d0)

* Enable VNC remote desktop if desired https://www.raspberrypi.org/documentation/remote-access/vnc/

* https://github.com/postmodern/chruby

```
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
```

* https://github.com/postmodern/ruby-install#readme

* `gem install bundler`

* `sudo apt-get install sqlite3`

* `sudo apt-get install libsqlite3-dev`

* `sudo apt-get install nmap`

* `git clone https://github.com/hdaniel/patrol.git`

* `cd patrol; bundle install`

* `bundle exec rake db:migrate`

* configure mail.  Edit `config/environments/development.rb` to add the correct SMTP settings.

* edit `/patrol/config/secrets.yml` to add your email addresses and site name.







