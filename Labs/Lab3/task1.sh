
#! /bin/bash
DATE=$(date +%H:%M:%S_%d.%m.%Y)
WEBSITE="www.net_nikogo.ru"
mkdir $HOME/test && echo "catalog test was created successfully" > ~/report && touch ~/test/$DATE.txt
(ping $WEBSITE -c 1 && echo "$WEBSITE is available" >> ~/report) || echo "$DATE $WEBSITE is available" >> ~/report

rm -r ~/test
cat ~/report
