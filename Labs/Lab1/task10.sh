#! /bin/bash

man bash | grep -o -i "[[:alnum:]]\{4,\}" | tr "[:upper:]" "[:lower:]" | sort | uniq -c | sort -n -r | head -3 | awk '{print $2}'
