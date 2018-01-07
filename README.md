# Patrol

Ruby on Rails app to track when new devices join your network and send an email notification.

Parses the XML output from [Nmap](https://nmap.org) and saves the entries to a local database.  Intended to run on a Raspberry Pi to monitor the local network and alert when new devices are detected.

Setting up a Raspberry Pi:

* [Headless Raspberry Pi Setup](https://hackernoon.com/raspberry-pi-headless-install-462ccabd75d0)

* Enable VNC remote desktop if desired https://www.raspberrypi.org/documentation/remote-access/vnc/

To install:

* Install Ruby, if needed. You may already have 2.3.3 installed and don't need to to this. See: https://github.com/postmodern/chruby

After chruby is installed, add these lines to your ~/.bashrc:

```
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
```

* You can use ruby-install to install the version of Ruby that you need.  Version 2.4.0 may be required to get past an openssl version issue.  See: https://github.com/postmodern/ruby-install#readme

`ruby-install ruby 2.4.0`
`chruby 2.4.0`

* Install bundler

`gem install bundler`

* Install sqlite3

`sudo apt-get install sqlite3`
`sudo apt-get install libsqlite3-dev`

* Install nmap

`sudo apt-get install nmap`

* Clone the patrol repo and initialize it

`git clone https://github.com/hdaniel/patrol.git`
`cd patrol; bundle install`
`bundle exec rake db:migrate`

* Configure your mail settings for notifications to go out.  Edit `config/environments/development.rb` to add the correct SMTP settings for your mail server.

* Edit `/patrol/config/secrets.yml` to add your email addresses and site name.







