#!/bin/bash

# add this to root's crontab:
# 00,15,30,45 * * * * nmap -oX /home/pi/patrol/public/nmap_output.xml -sP 192.168.2.*

# add this to your crontab:
# 05,20,35,50 * * * * $HOME/patrol/lib/bin/run_patrol.sh >/tmp/cron.log 2>&1

export PATH=/home/pi/.gem/ruby/2.4.0/bin:/home/pi/.rubies/ruby-2.4.0/lib/ruby/gems/2.4.0/bin:/home/pi/.rubies/ruby-2.4.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
source /usr/local/share/chruby/chruby.sh
chruby 2.4.0
cd /home/pi/patrol
bundle exec rails runner -e development Importer.new.call
