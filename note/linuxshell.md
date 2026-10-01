# 22-08-2026
# LINUX SHELL

## 1. Shell là gì?
`Shell` là chương trình trung gian giúp, con người và hệ thống giao tiếp vs nhau

 con người -> `shell` -> `linux kernel` -> `hardware`

 vd: khi gõ `ls` -> shel nhận lệnh và tìm chương trình tương ứng rồi yêu cầu linux thực thi

các shell phổ biến:
 - `sh`
 - `bash`
 - `zsh`
 - `fish`
---
## 2. Terminal != shell
*`Terminal`* là giao diện giúp tương tác vs shell

ví dụ:
 - gnome terminal
 - konsole

*`shell`* là chương trình nhận và xử lý cmd

`terminal` -> `bash` -> `linux kernel`
---
## 3. cấu trúc lệnh
1 lệnh tổng quát sẽ có các thành phần sau

`command` [`opt`] [`arguments`]

vd: ip addr show eth0 => show địa chỉ ip của card mạng ethernet 0

các thành phần:
 - ip -> command
 - add -> subcommand(hỗ trợ command)
 - show -> action
 - eth0 -> argument

không phải command nào cùng tuân theo 1 cấu trúc 
---
## 4. PATH
 là đường dẫn thư mục trong filesystem

 khi bạn gõ lệnh như `ls` -> bash tìm chương trình ls trong thư mục /bin xem nó có hay ko

 Chúng ta có thể dùng lệnh `which` để kiểm tra
 nếu nó xuất ra `/usr/bin/ls` đây là đường dẫn thư mục tuyệt đối,nơi chứa chương trình ls

 *`$path`* cũng liên quan đến đường dẫn ,nhưng có ý nghĩa đặt biệt:

 > `$path là 1 biến môi trường chứa ds các folder mà shell sẽ tìm khi bạn nhập command`

*tại sao shell lại cần $PATH?*
 
 Khi gõ lệnh `ls` ở terminal,không ai viết đường dẫn tuyệt đối cảu nó ra cả, nó dựa vào **$PATH**

 ví dụ **$PATH**:
 /usr/local/bin:/usr/bin:/bin

 Tìm /usr/local/bin/ls

↓

Không có


Tìm /usr/bin/ls

↓

Có!

↓

Chạy /usr/bin/ls

## 5.conmand vs ./command
- `comand` là lệnh hệ thống có thẻ chạy ở bất kì đâu, đọc ở trên.

vd: ls,pwd,mkdir

- `./command` là lệnh thực thi file tại chính thư mục đang chứa nó
- có cách khác để chạy file ở thư mục ko chưa nó là dùng path tuyệt đối

vd:
`ls` ở /usr/bin/ls đây là file hệ thống nên chạy đc ở bất kì đâu

`main.sh` là file thực thi, ở trong đường dẫn /home/code/bash/main.sh

chạy ở thư mục hiện tại: ./main.sh

néu ở thư mục khác như /home/code/c++ chẳng hạn mà muốn chạy `main.sh` thì gõ bash /home/code/bash/main.sh
hoặc ../bash/main.sh


## 6.built-in(tích hợp) command và external(mở rộng) command
ko phải mọi command đều là chương trình riêng

1.  built-in command
 - là các chức năng tích hợp trong shell

vd:
 - cd
 - echo
 - export
 - alias
 - pwd

khi bạn gõ cd /tmp => bash sẽ tự xử lý lệnh

bash ko tim /usr/bin/cd mà tự xử lý luôn

2. external command
 - là chương trình/executable nằm trên filesystem
 - thường nằm trong thư mục /bin
 - không nhất thiét có executable tương ứng

3. kiểm tra `type`
 - dùng `type` để kiểm tra xem loại

vd:
```
type cd - > cd is a shell builtin
```

```
type ls ->  ls is /usr/bin/ls
```

```
cd
 ↓
Bash tự xử lý

ls
 ↓
Bash tìm executable
 ↓
/usr/bin/ls
 ↓
chạy
```

4. alias:
 - dùng để tạo ngắn gọn lệnh để nhập

vd:
```
alias ll= 'ls -lah'
```
bản chất `ll` = `ls -lah`

kiểm tra:
```
type ll => ll í aliased to 'ls -lah'
```

4. tổng kết:

```
cd
 ↓
Builtin → Bash tự thực hiện

ls
 ↓
External → tìm trong $PATH → chạy executable

ll
 ↓
Alias → thay thế bằng command khác
```

## 7. ghép lệnh và luồng dữ liệu
1. command history:
- shell lưu lại những command bạn đã chạy

``` bash
history
```

```
100  pwd
101  ls
102  cd /tmp
103  ip addr
```

- chạy lại lệnh gần đây nhất: `!!`

```
100 apt update

=> sudo !!
=> sudo apt update
```

tìm command cũ:
```
ctrl + r
```
2. chạy nhiều command:
```
command_1 ; command_2
```

ví dụ:
```bash
mkdir test ; echo 'hello'
```
```
dù mkdir lỗi thì echo vẫn đc
```

3. `&&` - chạy khi thành công
``` bash
command_1 && command_2
```
> chạy khi command_1 thành công thì command_2 mới chạy

```
mkdir test
    │
    ├── thành công → cd test
    │
    └── thất bại  → dừng
```
4. `||` - chỉ chạy nếu thất bại
``` bash
command_1 || command_2
```
> nếu command_1 thất bại thì chạy command_2

``` bash
mkdir test || echo "Khong tao duoc thu muc"
```

```
mkdir test
    │
    ├── thành công → kết thúc
    │
    └── thất bại → echo
```

5. `&&` & `||` dựa vào exit status
- Mỗi command khi kết thúc sẽ trả về một exit status.
``` bash
echo $?
```

``` 
0       = thành công
khác 0  = thất bại/lỗi
```
