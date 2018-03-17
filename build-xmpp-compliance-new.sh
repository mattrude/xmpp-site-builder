#!/bin/bash

DIR="/root/xmpp-site"

#cd $DIR
#for account in `grep entry ${DIR}/accounts.xml | awk -F '"' '{print $2}'`; do
#  server=$(echo $account | awk -F '@' '{print $2}')
#  echo "--- testing $server ---"
#  java -jar ${DIR}/ComplianceTester-0.1.jar $account > ${DIR}/reports/$server.txt
#done;

/root/xmpp-site/update-site-content.sh

WEBDIR="/root/xmpp-site/site/_data"
WEBFILE="compliance.yml"

cd $DIR
for domain in `ls ${DIR}/reports/ |sed 's/.txt//g'`
do

cd $DIR
rm -rf $WEBDIR/$WEBFILE

    XEP0375=`grep 'Conversations Compliance Suite' /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
 
    echo "- name: ${domain}" > ${WEBDIR}/${WEBFILE}

    for XEP in 045 065 115 163 191 198 280 313 352 357 363 368 384
    do
        echo -n "  xep-0${XEP}: " >> ${WEBDIR}/${WEBFILE}
        grep XEP-0${XEP} /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}' >> ${WEBDIR}/${WEBFILE}
    done
    XEP0237=`grep 'Roster Versioning' /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    XEP0375=`grep 'Conversations Compliance Suite' /root/xmpp-site/reports/${domain}.txt |tail -1 |awk '{print $NF}'`
    echo "  xep-0237: ${XEP0237}" >> ${WEBDIR}/${WEBFILE}
    echo "  xep-0375: ${XEP0375}" >> ${WEBDIR}/${WEBFILE}

    #####################################################

    cd $DIR/site/
    echo -n "Building the site for ${domain}: "
    bundle exec jekyll build -q -c ../config/config-${domain}.yml
    echo "Done!"
done
