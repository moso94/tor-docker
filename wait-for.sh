#!/bin/sh

while [ $(curl --socks5 localhost:9150 --socks5-hostname localhost:9150 -s -o /dev/null -w "%{http_code}" https://check.torproject.org/) != 200 ]
do
    sleep 5
done
