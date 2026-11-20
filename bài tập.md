# [[note]]
1.  ls -la
2. find / -size +50M -size -100M
3. tar -xvjf dulieu.tar.gz
4. umont /mnt/nfs
5. mkdir -p /hdhlinux/slide
6. touch file1.txt file2.txt
7. cat part1.txt part2.txt > linux.txt
8. cp -a /var/www/html /tmp/backup
9. mv  "`*.log`" /hdhlinux
10. wc -w data.csv
11. head -n 15 server.log | tail -n 1
12. wc -l data.csv
13. grep -in "error" access.log
14. grep -w "error" access.log
15. find /var/log -size +50MB
16. find /tmp -name "`*.tmp`" -mtime +7
17. rmdir /hdhlinux
18. tar -cvfz linux.tar.gz project
19. tar -xJf linux.tar.gz -C /tmp 
20. tar -jtf linux.tar.bz2 
21. find /hdhlinx  -type f -empty
22. find /  -name "linux"
23. df -h
24. rm linux.txt
25. tar -cvfj linux.tar.bz2 linux
26. whoami
27. history 10
28. man  mkdir
29. mv data.txt linux.txt
30. cat part2.txt >> part1.txt
31. groupadd developers
32. useradd -m -s /bin/bash nghialv
33. passwd nghialv
34. usermod -aG developers nghialv
35. usermod -g developers nghialv
36. gpasswd -d nghialv developers
37. userdel  nghialv
38. userdel -r haianh
39. groupdel developers
40. passwd -l nghialv
41. passwd -u nghialv
42. passwd -e nghialv
43. chage -E 2028-12-31 nghialv
44. chage -l nghialv
45. su - nghialv
46. sudo  -u nghialv id
47. chmod g+w,o+r document.txt
48. chmod a-x script.sh
49. chmod u=rwx,g=rw,o= data.csv
50. chmod 760 data.csv
51. chmod -R ug+x project
52. chmod 644 report.docx
53. chmod 755 backup.sh
54. chmod 700 project
55. chown nghialv notes.txt
56. chgrp developets notes.txt
57. chown nghialv:developers scrip.sh
58. chown -R admin:sysadmin /var/www/html
59. umask 022
60. umask 027
61. chmod go-w config.php
62. chmod a+x script.sh
63. dpkg -l python
64. dpkg -s vsftpd
65. dpkg -i htop
66. ./configure
67. make 
68. make install
69. sudo apt purge htop
70. find document -name " `*.docx`"
71. nano smb.conf
72. ctrl o
73. ctrl x
74. ctrl w
75. ctrl u
76. vi smb.conf
77. i,o,a
78. esc
79. :wq
80. :q!
81.  dd
82. yy
83. p
84. :set nu
85. u
86.  lsblk -f
87. df -h
88. fdisk -l /dev/sdb
89. fdisk /dev/sdb
90. n
91. w
92. mkfs.ext4 /dev/sdb1
93. mkfs.VFAT /dev/sdb1
94. mount /dev/sdb1 /mnt/mydata
95. sudo quotacheck -cug /home
96. sudo quotaon -vug /home 
97. sudo edquota -u nghialv
98. sudo edquota -g developers
99. sudo edquota -p nghialv -u hungnq
100. sudo repquota -u /home