#! /bin/bash

grep -h -E -r -o -I '[[:alnum:]._]+@[[:alpha:]]+\.[[:alpha:]]+' /etc | tr '\n' ',' | sed 's/,$//' > emails.lst
