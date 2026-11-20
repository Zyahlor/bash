#!/bin/bash
clear
echo "[+] user:$(whoami)@$(hostname)"
echo "[+] kernel:$(uname -r)"
count=$(ps -e --no-headers | wc -l)
echo "[+] so tien chinh dang chay la:$count"
