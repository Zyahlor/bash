#!/bin/bash
echo "[+] backup"
backup="backup_$(date +%f_%H%M).tar.gz"
tar -czf "$backup"
echo "[+] da tao $backup !"
