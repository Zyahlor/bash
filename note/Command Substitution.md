# 10 - 10  - 2026
## 1. command substitution
- bash chạy command bên trong `$()`, thay luôn chỗ đó = output

```bash
username=$(whoami)
echo "Đang chạy bằng user: $username"
# Đang chạy bằng user: bao
```

Bash làm 2 bước: chạy `whoami` → được `bao` → câu lệnh thành `username=bao`.

## 2. cách dùng
### 1. Dùng trực tiếp, không cần biến

```bash
echo "Hôm nay là $(date +%F), kernel $(uname -r)"
echo "Có $(ls | wc -l) file trong thư mục này"
```
- trong đó:
- $(date +%f) - lấy ngày tháng
- $(uname -r) - lấy thông tin kernel
- $(ls | wc -l) - `ls`  liệt kê thư mục + `|` lấy ouput của command trước cho command sau + `wc -l` là đếm dòng -> đếm số mục chứa trong cái folder này
### 2. Lồng nhau (nesting)

```bash
echo "Thư mục cha: $(basename $(dirname $(pwd)))"
```

- thực hiện từ ngoặc trong cùng 
- `pwd` thực hiện trước
- `dirname`  = xuất đường dẫn bỏ phần tên cuối, lên 1 cấp  - thực hiện sau `pwd` 
- `basename` = chỉ lấy phần tử cuối - thực hiện sau cùng
```bash
# path: /home/bao/bash
pwd # = /home/bao/bash
dirname "$(pwd)" # = /home/bao
basename "$(dirname "$(pwd)")" # = bao
```

```bash
#!/bin/bash
target="10.10.10.5"

# Lưu IP máy mình trên tun0 (VPN THM/HTB)
my_ip=$(ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

# Đếm số port mở
open_count=$(nmap -p- --open -T4 "$target" -oG - | grep -o '/open/' | wc -l)

# Tạo thư mục theo ngày + target
mkdir -p "scan_$(date +%F)_$target"

echo "[+] LHOST = $my_ip"
echo "[+] $target có $open_count port mở"
```

### 4. Dùng trong điều kiện / vòng lặp

```bash
# Lặp qua kết quả của command
for user in $(cut -d: -f1 /etc/passwd); do
  echo "User: $user"
done

# So sánh với output
if [ "$(whoami)" = "root" ]; then
  echo "Đang là root"
else
  echo "Chưa root, cần sudo"
fi
```

### 5. Lỗi hay gặp

|❌ Sai|✅ Đúng|Lý do|
|---|---|---|
|`x = $(date)`|`x=$(date)`|Gán biến **không được có khoảng trắng** quanh `=`|
|`echo $(cat file)`|`echo "$(cat file)"`|Không có `"` thì mất xuống dòng, bị tách từ|
|`` x=`date` ``|`x=$(date)`|Backtick vẫn chạy nhưng cũ, khó đọc, khó lồng|
|`for f in $(ls)`|`for f in *`|`ls` hỏng khi tên file có dấu cách|
|`out=$(cmd)` rồi quên check lỗi|`out=$(cmd) \| exit 1`|`$?` sau gán biến là exit code của `cmd`|

### 6. Điểm cần nhớ

bash

```bash
# stdout mới được bắt, stderr thì KHÔNG
out=$(ls /khong_ton_tai)        # lỗi vẫn in ra màn hình, out rỗng
out=$(ls /khong_ton_tai 2>&1)   # gộp cả lỗi vào out

# Exit code
x=$(false); echo $?             # 1
```

### Tóm tắt

|Cú pháp|Dùng khi|
|---|---|
|`var=$(cmd)`|Lưu output vào biến|
|`"...$(cmd)..."`|Nhúng output vào chuỗi|
|`"$(cmd)"`|**Luôn bọc nháy kép** khi dùng làm argument|
|`$(cmd1 $(cmd2))`|Lồng command|