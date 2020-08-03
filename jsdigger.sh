#!/bin/bash
echo "enter_recon_number":
read varname
mkdir /root/home/sniper/$varname
for url in $(cat urls.txt);do
wget -nv $url -P /root/home/sniper/$varname
done
for file in /root/home/sniper/$varname/*; do
cat $file | grep -aoP "(?<=(\"|\'|\`))\/[a-zA-Z0-9_?&=\/\-\#\.]*(?=(\"|\'|\`))" | sort -u
done
rm -r /root/home/sniper/$varname
