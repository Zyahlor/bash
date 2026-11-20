# 22-08-2026
# 🐚 Lộ trình học Bash Scripting

> **Mục tiêu:** Từ người mới bắt đầu → có khả năng viết Bash script để tự động hóa Linux, Network và Pentest.

---

## 🎯 Mục tiêu cuối

Sau khi hoàn thành lộ trình, có thể:

* [x] Viết Bash script từ đầu ✅ 2026-10-10
* [ ] Hiểu cách Bash xử lý command, biến, input/output
* [ ] Sử dụng điều kiện, vòng lặp, function
* [ ] Xử lý file và text bằng `grep`, `sed`, `awk`
* [ ] Xử lý pipe, redirect và exit code
* [ ] Viết script có error handling
* [ ] Làm việc với process, service và filesystem
* [ ] Tự động hóa các tác vụ Network
* [ ] Làm việc với JSON, API bằng `curl` + `jq`
* [ ] Viết script phục vụ Pentest
* [ ] Biết debug và tối ưu Bash script
* [ ] Hoàn thành một số mini-project thực tế

---

# 🟢 LEVEL 1: Bash Fundamentals

## 1. Linux Shell

* [x] Shell là gì? ✅ 2026-09-21
* [x] Bash là gì? ✅ 2026-10-10
* [x] Bash vs `sh` vs `zsh` ✅ 2026-10-10
* [x] Terminal vs Shell ✅ 2026-10-10
* [x] Command structure ✅ 2026-10-10
* [x] Command + option + argument ✅ 2026-10-10
* [x] `man` ✅ 2026-10-10
* [x] `--help` ✅ 2026-10-10
* [x] PATH và `$PATH` ✅ 2026-10-10

### Thực hành

* [x] `pwd` ✅ 2026-10-10
* [x] `ls` ✅ 2026-10-10
* [x] `cd` ✅ 2026-10-10
* [x] `mkdir` ✅ 2026-10-10
* [x] `touch` ✅ 2026-10-10
* [x] `cp` ✅ 2026-10-10
* [x] `mv` ✅ 2026-10-10
* [x] `rm` ✅ 2026-10-10

---

## 2. [[BASH SCRIPTING]] đầu tiên

* [x] Tạo `.sh` ✅ 2026-10-10
* [x] Shebang `#!/bin/bash` ✅ 2026-10-10
* [x] `chmod +x` ✅ 2026-10-10
* [x] Chạy script bằng `./script.sh` ✅ 2026-10-10
* [x] Chạy script bằng `bash script.sh` ✅ 2026-10-10
* [x] Comment ✅ 2026-10-10

### Mini Project

* [x] `hello.sh` ✅ 2026-10-10
* [x] `system_info.sh` ✅ 2026-10-10

---

# 🟢 LEVEL 2: Variables & Input

## 3. [[variable]]

* [x] Khai báo biến ✅ 2026-10-10
* [x] Sử dụng biến ✅ 2026-10-10
* [x] String ✅ 2026-10-10
* [x] Number ✅ 2026-10-10
* [x] Environment variable ✅ 2026-10-10
* [x] Special variables ✅ 2026-10-10

### Special Variables

```text
$0
$1
$2
$#
$@
$?
$$
$USER
$HOME
$PWD
```

---

## 4. [[Command Substitution]]

* [ ] `$(command)`
* [ ] Lưu output command vào biến
* [ ] Kết hợp nhiều command

Ví dụ:

```bash
username=$(whoami)
hostname=$(hostname)
kernel=$(uname -r)
```

---

## 5. User Input

* [ ] `read`
* [ ] `read -p`
* [ ] Input validation cơ bản

### Mini Project

* [ ] `user_info.sh`
* [ ] Nhập username
* [ ] Nhập IP
* [ ] Nhập port

---

# 🟢 LEVEL 3: [[Control Flow]]

## 6. if / elif / else

* [ ] `if`
* [ ] `elif`
* [ ] `else`
* [ ] `test`
* [ ] `[ ]`
* [ ] `[[ ]]`

### String comparison

```bash
=
!=
-z
-n
```

### [[toán tử trong BASH]]

```bash
-eq
-ne
-gt
-lt
-ge
-le
```

### File test

```bash
-f
-d
-r
-w
-x
-e
```

---

## 7. case

* [ ] `case`
* [ ] Pattern matching
* [ ] Default case

### Mini Project

* [ ] Menu CLI

Ví dụ:

```text
1. Network information
2. Disk information
3. Memory information
4. Process information
5. Exit
```

---

## 8. Loops

### for

* [ ] `for`
* [ ] Iterate list
* [ ] Iterate files
* [ ] Iterate command output

### while

* [ ] `while`
* [ ] Counter
* [ ] Read file line-by-line

### Loop control

* [ ] `break`
* [ ] `continue`

### Mini Project

* [ ] Ping nhiều host
* [ ] Kiểm tra nhiều port
* [ ] Duyệt danh sách IP

---

# 🟡 LEVEL 4: Functions, Arrays & Strings

## 9. Functions

* [ ] Khai báo function
* [ ] Gọi function
* [ ] Function arguments
* [ ] Return value
* [ ] Local variables

Ví dụ:

```bash
scan_host() {
    echo "Scanning $1"
}
```

---

## 10. Arrays

* [ ] Indexed array
* [ ] Associative array
* [ ] `${array[@]}`
* [ ] `${#array[@]}`
* [ ] Loop qua array

### Mini Project

* [ ] Port scanner đơn giản
* [ ] Service checker

---

## 11. String Processing

* [ ] String length
* [ ] Substring
* [ ] String replacement
* [ ] Pattern matching
* [ ] Quoting
* [ ] `" "` vs `' '`

Đặc biệt:

* [ ] Word splitting
* [ ] Glob expansion
* [ ] Shell expansion

---

# 🟡 LEVEL 5: Linux Text Processing

Đây là phần **cực kỳ quan trọng đối với Bash**.

## 12. Pipe & Redirection

* [ ] `>`
* [ ] `>>`
* [ ] `<`
* [ ] `2>`
* [ ] `2>&1`
* [ ] `|`
* [ ] `/dev/null`

---

## 13. grep

* [ ] Search text
* [ ] Regex cơ bản
* [ ] `grep -i`
* [ ] `grep -v`
* [ ] `grep -r`
* [ ] `grep -E`

---

## 14. cut / sort / uniq / wc

* [ ] `cut`
* [ ] `sort`
* [ ] `uniq`
* [ ] `wc`
* [ ] Pipeline nhiều command

Ví dụ:

```bash
cat access.log | grep "404" | sort | uniq -c
```

---

## 15. sed

* [ ] Search
* [ ] Replace
* [ ] Delete
* [ ] Print
* [ ] Regex với `sed`

---

## 16. awk

* [ ] Field
* [ ] `$1`, `$2`, `$NF`
* [ ] `BEGIN`
* [ ] `END`
* [ ] Condition
* [ ] Loop
* [ ] Variables

### Mini Project

* [ ] Log analyzer
* [ ] Phân tích access log
* [ ] Tìm IP xuất hiện nhiều nhất
* [ ] Tìm HTTP status phổ biến

---

# 🟠 LEVEL 6: Robust Bash

## 17. Exit Status

* [ ] `$?`
* [ ] Exit code
* [ ] `exit`
* [ ] `return`
* [ ] Success = `0`
* [ ] Error = non-zero

---

## 18. Error Handling

* [ ] `set -e`
* [ ] `set -u`
* [ ] `set -o pipefail`
* [ ] `set -x`
* [ ] `set -euo pipefail`

Hiểu rõ:

```bash
set -euo pipefail
```

Không được chỉ copy. Phải hiểu **từng flag gây ra điều gì**.

---

## 19. Debugging

* [ ] `bash -x script.sh`
* [ ] `set -x`
* [ ] `set +x`
* [ ] Kiểm tra exit code
* [ ] Debug từng command

---

## 20. Signal & Trap

* [ ] Signal là gì?
* [ ] `SIGINT`
* [ ] `SIGTERM`
* [ ] `SIGEXIT`
* [ ] `trap`

### Mini Project

* [ ] Script tạo temporary files
* [ ] Cleanup tự động khi script kết thúc

---

# 🟠 LEVEL 7: Linux Automation

## 21. Filesystem

* [ ] `find`
* [ ] File permissions
* [ ] Ownership
* [ ] Symbolic links
* [ ] Temporary files
* [ ] `/tmp`
* [ ] `/var/log`

---

## 22. Process

* [ ] `ps`
* [ ] `pgrep`
* [ ] `pkill`
* [ ] `kill`
* [ ] PID
* [ ] Background process
* [ ] `&`
* [ ] `jobs`
* [ ] `fg`
* [ ] `bg`
* [ ] `wait`

---

## 23. Services

* [ ] `systemctl`
* [ ] `journalctl`
* [ ] Service status
* [ ] Service restart
* [ ] Service logs

### Mini Project

* [ ] Linux server health checker

Kiểm tra:

```text
CPU
RAM
Disk
Network
Services
Processes
Open ports
System logs
```

---

# 🟠 LEVEL 8: Network Automation

## 24. Network Commands

* [ ] `ip`
* [ ] `ss`
* [ ] `ping`
* [ ] `traceroute`
* [ ] `dig`
* [ ] `host`
* [ ] `curl`
* [ ] `wget`
* [ ] `nc`

---

## 25. Bash + Network

* [ ] Ping sweep
* [ ] Port checking
* [ ] DNS lookup automation
* [ ] HTTP status checking
* [ ] Header checking
* [ ] Service detection cơ bản

### Mini Project

```text
network_scanner.sh
```

Input:

```text
192.168.1.0/24
```

Output:

```text
192.168.1.1   UP
192.168.1.10  UP
192.168.1.20  DOWN
```

---

# 🔴 LEVEL 9: Bash cho Pentest

## 26. Recon Automation

* [ ] Target validation
* [ ] DNS enumeration
* [ ] Subdomain enumeration
* [ ] IP resolution
* [ ] Port scanning
* [ ] HTTP probing
* [ ] Result collection

Kết hợp:

```text
bash
 ├── dig
 ├── curl
 ├── nmap
 ├── grep
 ├── awk
 ├── sed
 └── sort
```

---

## 27. Bash + Nmap

* [ ] Chạy Nmap từ Bash
* [ ] Parse output
* [ ] Lưu kết quả
* [ ] Loop qua nhiều target
* [ ] Tạo report

---

## 28. Bash + curl

* [ ] HTTP request
* [ ] Headers
* [ ] Status code
* [ ] GET
* [ ] POST
* [ ] Authentication cơ bản
* [ ] API interaction

---

## 29. JSON với jq

* [ ] JSON structure
* [ ] `jq`
* [ ] Extract field
* [ ] Filter
* [ ] Loop JSON data

Ví dụ:

```bash
curl -s https://example.com/api | jq '.users[]'
```

---

# 🔴 LEVEL 10: Advanced Bash

## 30. Advanced Parameter Expansion

* [ ] `${var:-default}`
* [ ] `${var:=default}`
* [ ] `${var:?error}`
* [ ] `${var:+value}`
* [ ] `${#var}`
* [ ] `${var%pattern}`
* [ ] `${var%%pattern}`
* [ ] `${var#pattern}`
* [ ] `${var##pattern}`

---

## 31. Regex

* [ ] Bash regex
* [ ] `[[ string =~ regex ]]`
* [ ] Capture groups
* [ ] Validation

---

## 32. File Descriptors

* [ ] stdin
* [ ] stdout
* [ ] stderr
* [ ] File descriptor `0`
* [ ] File descriptor `1`
* [ ] File descriptor `2`
* [ ] Custom file descriptors

---

## 33. Subshell

* [ ] `( )`
* [ ] `{ }`
* [ ] Process substitution
* [ ] Command substitution
* [ ] Environment inheritance

---

## 34. Parallelism

* [ ] Background jobs
* [ ] `wait`
* [ ] GNU `parallel`
* [ ] Parallel network checks
* [ ] Job control

---

# 🧪 PROJECTS

## Beginner

* [ ] Hello World
* [ ] User information
* [ ] System information
* [ ] Calculator
* [ ] File organizer

## Intermediate

* [ ] Log analyzer
* [ ] Backup script
* [ ] Server health checker
* [ ] Process monitor
* [ ] Network checker

## Advanced

* [ ] Ping sweep
* [ ] Port checker
* [ ] DNS enumeration automation
* [ ] HTTP reconnaissance
* [ ] Nmap automation
* [ ] Automated reconnaissance framework

---

# 🧠 Kiến thức cần nhớ

Không học Bash theo kiểu:

```text
"grep có 37 option, phải thuộc hết."
```

Học theo tư duy:

```text
INPUT
  ↓
COMMAND
  ↓
PROCESS
  ↓
OUTPUT
  ↓
PIPE
  ↓
ANOTHER COMMAND
  ↓
RESULT
```

Ví dụ:

```bash
cat access.log \
| grep "404" \
| awk '{print $1}' \
| sort \
| uniq -c \
| sort -nr
```

Đây chính là sức mạnh của Bash.

---

# 🏁 Chuẩn đầu ra

Sau khi hoàn thành:

* [ ] Tự viết Bash script mà không cần AI viết hộ
* [ ] Đọc và hiểu script Bash của người khác
* [ ] Debug script
* [ ] Xử lý file/log
* [ ] Automation Linux
* [ ] Automation Network
* [ ] Automation Pentest
* [ ] Kết hợp Bash với các tool khác
* [ ] Biết khi nào **không nên dùng Bash**

> **Mục tiêu cuối cùng không phải trở thành Bash wizard.**
>
> Mục tiêu là nhìn một công việc lặp đi lặp lại trên Linux và nghĩ:
>
> **"Cái này script hóa được."** 🐧
