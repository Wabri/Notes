#/usr/bin/env bash

ip addr | awk 'BEGIN{OFS=" "} /inet/ {if($NF == "eth1") print $2}' | awk 'BEGIN{FS="/"} {print $1}'
