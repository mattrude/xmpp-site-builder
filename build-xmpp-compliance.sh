#!/bin/bash

DIR="/root/xmpp-site"

#cd $DIR
#for account in `grep entry ${DIR}/accounts.xml | awk -F '"' '{print $2}'`; do
#  server=$(echo $account | awk -F '@' '{print $2}')
#  echo "--- testing $server ---"
#  java -jar ${DIR}/ComplianceTester-0.1.jar $account > ${DIR}/reports/$server.txt
#done;

/root/xmpp-site/update-site-content.sh

WEBDIR="/root/xmpp-site/site/pages"
WEBFILE="compliance.html"

cd $DIR
for domain in `ls ${DIR}/reports/ |sed 's/.txt//g'`
do

cd $DIR
rm -rf $WEBDIR/$WEBFILE
echo "---
layout: default
title: Server Compliance
permalink: /pages/compliance/
---" > $WEBDIR/$WEBFILE
    echo "<h1> XMPP Standards Compliance</h1>" >> $WEBDIR/$WEBFILE
    echo "<p>The XMPP Standards Foundation (XSF) defines protocol suites for the purpose of compliance testing and software certification. This was layed out in <a href='https://xmpp.org/extensions/xep-0375.html'>XEP-0375</a>.  The below chart indicates the current status of the server for each standred.</p>" >> $WEBDIR/$WEBFILE
    echo "<table class='table'><thead><tr><th>Compliance Test: ${domain}</th><th>Results</th></tr></thead><tbody>" >> $WEBDIR/$WEBFILE

#    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0115.html'>XEP-0115</a>: Entity Capabilities</td><td class=`grep XEP-0115 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep XEP-0115 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE

    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0163.html'>XEP-0163</a>: Personal Eventing Protocal<small> - via internal module <a href='https://prosody.im/doc/modules/mod_pep'>mod_pep</a></small></td><td class=`grep XEP-0163 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep XEP-0163 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE

    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0237.html'>XEP-0237</a>: Roster Versioning<small> - via internal module <a href='https://prosody.im/doc/modules/mod_roster'>mod_roster</a></small></td><td class=`grep 'Roster Versioning' /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep 'Roster Versioning' /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE

    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0280.html'>XEP-0280</a>: Message Carbons<small> - via community module <a href='https://modules.prosody.im/mod_carbons'>mod_carbons</a></small></td><td class=`grep XEP-0280 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep XEP-0280 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE

    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0191.html'>XEP-0191</a>: Blocking Command<small> - via community module <a href='https://prosody.im/doc/modules/mod_blocklist'>mod_blocklist</a></small></td><td class=`grep XEP-0191 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep XEP-0191 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE

    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0045.html'>XEP-0045</a>: Multi-User Chat (Conferences)<small> - via internal module <a href='https://prosody.im/doc/modules/mod_muc'>mod_muc</a></small></td><td class=`grep XEP-0045 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep XEP-0045 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE

    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0198.html'>XEP-0198</a>: Stream Management<small> - via internal module <a href='https://modules.prosody.im/mod_smacks.html'>mod_smacks</a></small></td><td class=`grep XEP-0198 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep XEP-0198 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE

    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0313.html'>XEP-0313</a>: Message Archive Management<small> - via community modules <a href='https://modules.prosody.im/mod_mam.html'>mod_mam</a> and <a href='https://modules.prosody.im/mod_mam_muc.html'>mod_mam_muc</a><small></td><td class=`grep XEP-0313 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep XEP-0313 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE

    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0352.html'>XEP-0352</a>: Client State Indication<small> - via community module <a href='https://modules.prosody.im/mod_csi.html'>mod_csi</a></small></td><td class=`grep XEP-0352 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep XEP-0352 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE

    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0363.html'>XEP-0363</a>: HTTP File Upload<small> - via internal module <a href='https://modules.prosody.im/mod_http_upload.html'>mod_http_upload</a></small></td><td class=`grep XEP-0363 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep XEP-0363 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE

    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0065.html'>XEP-0065</a>: SOCKS5 Bytestreams (Proxy)<small> - via internal module <a href='https://prosody.im/doc/modules/mod_proxy65'>mod_proxy65</a></small></td><td class=`grep XEP-0065 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep XEP-0065 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE

    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0160.html'>XEP-0160</a>: Best Practices for Handling Offline Messages<small> - via internal module <a href='https://prosody.im/doc/modules/mod_offline'>mod_offline</a></small></td><td class=`grep XEP-0160 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep XEP-0160 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE

    echo "<tr><td><a href='https://xmpp.org/extensions/xep-0357.html'>XEP-0357</a>: Push Notifications<small> - via coummunity module <a href='https://modules.prosody.im/mod_cloud_notify.html'>mod_cloud_notify</a></small></td><td class=`grep XEP-0357 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`>`grep XEP-0357 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`</td></tr>" >> $WEBDIR/$WEBFILE
    echo "</tbody></table>" >> $WEBDIR/$WEBFILE

    echo "{% include clients.html %}" >> $WEBDIR/$WEBFILE

    echo "<p class=pull-left>Status build using the XMPP <a href='https://github.com/iNPUTmice/ComplianceTester'>Compliance Tester</a>.</p>" >> $WEBDIR/$WEBFILE

    echo "<p style='text-align:right;'><small>Last Updated: `date`</small></p>" >> $WEBDIR/$WEBFILE

    XEP0163=`grep XEP-0163 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0237=`grep 'Roster Versioning' /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0280=`grep XEP-0280 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0191=`grep XEP-0191 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0045=`grep XEP-0045 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0198=`grep XEP-0198 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0313=`grep XEP-0313 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0352=`grep XEP-0352 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0363=`grep XEP-0363 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0065=`grep XEP-0065 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0160=`grep XEP-0160 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0357=`grep XEP-0357 /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0375=`grep 'Conversations Compliance Suite' /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`


    if [ "$XEP0163" == "PASSED" ]; then
        sed -i 's/xep-0163\:\ 0/xep-0163\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0163 is true for ${domain}"
    else
        sed -i 's/xep-0163\:\ 1/xep-0163\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0163 is false for ${domain}"
    fi

    # XEP-0237
    if [ "$XEP0237" == "PASSED" ]; then
        sed -i 's/xep-0237\:\ 0/xep-0237\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0237 is true for ${domain}"
    else
        sed -i 's/xep-0237\:\ 1/xep-0237\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0237 is false for ${domain}"
    fi

    # XEP-0280
    if [ "$XEP0280" == "PASSED" ]; then
        sed -i 's/xep-0280\:\ 0/xep-0280\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0280 is true for ${domain}"
    else
        sed -i 's/xep-0280\:\ 1/xep-0280\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0280 is false for ${domain}"
    fi

    # XEP-0191
    if [ "$XEP0191" == "PASSED" ]; then
        sed -i 's/xep-0191\:\ 0/xep-0191\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0191 is true for ${domain}"
    else
        sed -i 's/xep-0191\:\ 1/xep-0191\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0191 is false for ${domain}"
    fi

    # XEP-0045
    if [ "$XEP0045" == "PASSED" ]; then
        sed -i 's/xep-0045\:\ 0/xep-0045\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0045 is true for ${domain}"
    else
        sed -i 's/xep-0045\:\ 1/xep-0045\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0045 is false for ${domain}"
    fi

    # XEP-0198
    if [ "$XEP0198" == "PASSED" ]; then
        sed -i 's/xep-0198\:\ 0/xep-0198\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0198 is true for ${domain}"
    else
        sed -i 's/xep-0198\:\ 1/xep-0198\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0198 is false for ${domain}"
    fi

    # XEP-0313
    if [ "$XEP0313" == "PASSED" ]; then
        sed -i 's/xep-0313\:\ 0/xep-0313\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0313 is true for ${domain}"
    else
        sed -i 's/xep-0313\:\ 1/xep-0313\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0313 is false for ${domain}"
    fi

    # XEP-0352
    if [ "$XEP0352" == "PASSED" ]; then
        sed -i 's/xep-0352\:\ 0/xep-0352\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0352 is true for ${domain}"
    else
        sed -i 's/xep-0352\:\ 1/xep-0352\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0352 is false for ${domain}"
    fi

    # XEP-0363
    if [ "$XEP0363" == "PASSED" ]; then
        sed -i 's/xep-0363\:\ 0/xep-0363\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0363 is true for ${domain}"
    else
        sed -i 's/xep-0363\:\ 1/xep-0363\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0363 is false for ${domain}"
    fi

    # XEP-0065
    if [ "$XEP0065" == "PASSED" ]; then
        sed -i 's/xep-0065\:\ 0/xep-0065\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0065 is true for ${domain}"
    else
        sed -i 's/xep-0065\:\ 1/xep-0065\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0065 is false for ${domain}"
    fi

    # XEP-0160
    if [ "$XEP0160" == "PASSED" ]; then
        sed -i 's/xep-0160\:\ 0/xep-0160\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0160 is true for ${domain}"
    else
        sed -i 's/xep-0160\:\ 1/xep-0160\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0160 is false for ${domain}"
    fi

    # XEP-0357
    if [ "$XEP0357" == "PASSED" ]; then
        sed -i 's/xep-0357\:\ 0/xep-0357\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0357 is true for ${domain}"
    else
        sed -i 's/xep-0357\:\ 1/xep-0357\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0357 is false for ${domain}"
    fi

    # XEP-0375
    if [ "$XEP0375" == "PASSED" ]; then
        sed -i 's/xep-0375\:\ 0/xep-0375\:\ 1/g' config/config-${domain}.yml
#        echo "XEP-0375 is true for ${domain}"
    else
        sed -i 's/xep-0375\:\ 1/xep-0375\:\ 0/g' config/config-${domain}.yml
#        echo "XEP-0375 is false for ${domain}"
    fi


    cd $DIR/site/
    echo -n "Building the site for ${domain}: "
    bundle exec jekyll build -q -c ../config/config-${domain}.yml
    echo "Done!"
done
