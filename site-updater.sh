#!/bin/bash

VERSION=`ejabberdctl status |tail -1 |awk '{ print $2 }'`
GITVERSION=`git --git-dir=/var/src/ejabberd/.git log |head -1 |awk '{print $2}'`

for DOMAIN in mattrude.com therudes.com soderparr.com
do
  sed -i "s/^ejabberd-version.*/ejabberd-version: \"${VERSION}\"/g" /root/xmpp-site/config/config-${DOMAIN}.yml
  sed -i "s/^ejabberd-gitversion.*/ejabberd-gitversion: \"${GITVERSION}\"/g" /root/xmpp-site/config/config-${DOMAIN}.yml
done

/root/xmpp-site/update-site-content.sh

#sed -i "s/^ejabberd-version.*/ejabberd-version: \"${VERSION}\"/g" /root/xmpp-site/config/config-mattrude.com.yml
#sed -i "s/^ejabberd-version.*/ejabberd-version: \"${VERSION}\"/g" /root/xmpp-site/config/config-therudes.com.yml
#sed -i "s/^ejabberd-version.*/ejabberd-version: \"${VERSION}\"/g" /root/xmpp-site/config/config-soderparr.com.yml
#sed -i "s/^ejabberd-gitversion.*/ejabberd-gitversion: \"${GITVERSION}\"/g" /root/xmpp-site/config/config-mattrude.com.yml
#sed -i "s/^ejabberd-gitversion.*/ejabberd-gitversion: \"${GITVERSION}\"/g" /root/xmpp-site/config/config-therudes.com.yml
#sed -i "s/^ejabberd-gitversion.*/ejabberd-gitversion: \"${GITVERSION}\"/g" /root/xmpp-site/config/config-soderparr.com.yml

cd /root/xmpp-site/sites/lite/ && rm -rf /var/www/im.mattrude.com && bundle exec jekyll build -c /root/xmpp-site/config/config-mattrude.com.yml -q
cd /root/xmpp-site/sites/lite/ && rm -rf /var/www/im.soderparr.com && bundle exec jekyll build -c /root/xmpp-site/config/config-soderparr.com.yml -q
cd /root/xmpp-site/sites/lite/ && rm -rf /var/www/im.therudes.com && bundle exec jekyll build -c /root/xmpp-site/config/config-therudes.com.yml -q
