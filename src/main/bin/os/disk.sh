#!/usr/bin/env bash

#查看磁盘总容量
df -BM | awk 'NR>1{print $2}' | awk '{sum += $1};END {print sum}' |awk '{printf "Total Disk : %.2fGB\n",$1/1024}'