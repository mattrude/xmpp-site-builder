#!/bin/bash

VERSION=`ejabberdctl status |tail -1 |awk '{ print $2 }'`

sed -i "s/^ejabberd-version.*/ejabberd-version: \"${VERSION}\"/g" /root/xmpp-site/config/config-mattrude.com.yml
sed -i "s/^ejabberd-version.*/ejabberd-version: \"${VERSION}\"/g" /root/xmpp-site/config/config-therudes.com.yml
sed -i "s/^ejabberd-version.*/ejabberd-version: \"${VERSION}\"/g" /root/xmpp-site/config/config-soderparr.com.yml

cd /root/xmpp-site/sites/lite/ && rm -rf /var/www/im.mattrude.com && bundle exec jekyll build -c /root/xmpp-site/config/config-mattrude.com.yml -q

cd /root/xmpp-site/sites/lite/ && rm -rf /var/www/im.soderparr.com && bundle exec jekyll build -c /root/xmpp-site/config/config-soderparr.com.yml -q

cd /root/xmpp-site/sites/placeholder/ && rm -rf /var/www/im.therudes.com && bundle exec jekyll build -c /root/xmpp-site/config/config-therudes.com.yml -q
