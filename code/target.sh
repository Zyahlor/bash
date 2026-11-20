#!/bin/bash
target="$1"
if [ -z "$target" ]; then
    echo "[+] cach dung: $0 <ip>" >&2
    exit 1
fi
dir="recon_${target}_$(date +%F)"
mkdir -p "$dir"
nmap -F "$target" -oN "$dir/nmap.txt" > /dev/null

open_count=$(grep -c ' open '"$dir/nmap.txt")
echo "[+] $target có $open_count port mở"
