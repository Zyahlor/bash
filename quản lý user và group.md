## 1. quản lý user

| Lệnh      | Thuộc tính           | Công dụng                                 |
| --------- | -------------------- | ----------------------------------------- |
| `useradd` | `-m`                 | Tạo user và thư mục Home                  |
| `useradd` | `-s`                 | Chỉ định shell đăng nhập                  |
| `passwd`  | Không có             | Đặt mật khẩu cho user                     |
| `usermod` | `-aG`                | Thêm user vào nhóm phụ                    |
| `usermod` | `-G`                 | Thay đổi danh sách nhóm phụ               |
| `userdel` | `-r`                 | Xóa user và thư mục Home                  |
| `su`      | `-`                  | Chuyển sang phiên đăng nhập của user khác |
| `whoami`  | Không có             | Kiểm tra user hiện tại                    |
| `id`      | Tên user             | Xem UID, GID và các nhóm của user         |
| chage     | -l,-m,-M,-W,-I,-E,-d | quản lý và thay đổi mật khẩu              |
- `passwd` có 2 tham số:
- `-l`: khóa user
- `-u`: mở khóa user
- `-e`: bặt buộc phải đổi mật khâu ngay lần đầu đăng nhặp
- `usermod` có thêm thông số `-g`: thay  đổi nhóm của user thành nhóm chính
- `chage` có các thống số:
- `-l`:liệt kê chi tiết về chính sách mật khẩu
- `-m`:số ngày tối thiểu giữa 2 lần đổi mk
- `-M`:số ngày tối đa mà mk có giá trị trước khi buộc phải đổi
- `-W`:số ngày tài hiển trị cảnh báo trc khi mk hết hạn
- `-I`:số ngày vô hiệu sau khi mk hết hạn
- `-E`:ngày cụ thể tk bị khóa hoàn toàn
- `-d`:đặt lại ngày thay đổi mk lần cuối (đặt là 0 thì buộc phải thay đổi tới lần đăng nhau tiếp theo)

``` bash
# tao user && thu muc home
sudo usser -m -s /bin/bash [name_user]
# dat mat khau cho user
sudo passwd [name_user]
# add vao nhom
sudo usermod -aG [name_group] [name_user]
# kiem tra xem uid,gid
id [name_user]
# chuyen doi user
su - [name_user]
# kiem tra 
whoami
# thoat user
exit
# xoa user va thu muc home
sudo userdel -r [name_user]
```
- `chage`
``` bash
# xem thong tin han dung mk cua 1 tk
sudo chage -l [name_user]
# buoc thay mk o lan dang nhap ke tiep
sudo chage -d 0 [name_user]
# dat thoi han toi da cho mk
sudo chage -M 90 [name_user]
# dat thoi gian canh bao trc het han
sudo chage -W 7 [name_user]
# thiet lap ngay het han cu the
sudo chage -E 2028-12-31 [name_user]
```
- đổi user account:`su`
``` bash
# chuyen sang user khac - thu muc va moi truong lam viec giu nguyen
su [name_user]
# chuyen sang ma thay doi ca thu muc va moi truong
su - [name_user]
su --login [name_user]
# chuyen sang quyen root
su -
# chay cau lenh duy nhat duoi quyen cua ng khac
su -u [name_user] [lệnh]
```
## 2. quản lý group

|Lệnh|Thuộc tính|Công dụng|
|---|---|---|
|`groupadd`|Không có|Tạo nhóm mới|
|`groupdel`|Không có|Xóa nhóm|
|`getent group`|Tên nhóm|Xem thông tin nhóm|
|`gpasswd`|`-d`|Xóa user khỏi nhóm|
``` bash
# tao group
sudo groupadd [name_group]
# xem thong tin nhom
getent group [name_group]
# xoa user khoi nhom
sudo gpasswd -d [name_user] [name_group]
# xoa group 
sudo groupdel [namegroup]
```
## 3. chmod - gán quyền
### 3.1 thay đối quyền truy cập
``` bash
chmod [quyen] ten_file
```
- gán quyền = số:
- 4 = r, 2=w,1=x
- có 3 nhóm: 1 - User , 2 - group 
- 1 nhóm có 3 quyền trên và tổng = 7 - tức là r+w+x = 4+2+1 = 7
- riêng tập tin thì chỉ có 6 ko có quyền thực thi
- khi gán quyền bắt buộc phải 3 số vì cho 3 nhóm trên
### 3.2 gán bằng kí tự

tương tự như trên nhưng thay vì số thì ta gán bằng ký tự
- ký tự gồm:
- u - User 
- g - Group
- O - other
- a - all
- + = thêm , - = bỏ, = gán chính xác quyền
``` bash
# cho file la linux.txt
# cap owner full quyen,group doc viet, other ko co gi
chmod u=rwx,g=rw,o= data.csv
# them quyen cho other doc
chmod o+r linux.txt
```
## 4. chown - thay đổi chủ sở hữu
``` bash
# chỉ đổi chủ vs user
chown [username] [name_file]
# đổi chủ cho user và nhóm
chown [username]:[name_group] [name_file]
# chỉ đỏi nhóm
chown :[name_group] [file_name]
# thay đổi đệ quy tức là bên trong nó có gì sẽ đổi thành của user or group hết
chown -R [username]:[group] [folder]
```
### 5.chgrp - thay đổi nhóm sở hữu


```bash
chgrp [name_group] [name_file] or [name_folder]
# de quy
chgrp -R [name_group] [name_folder]
```
## 6. umask - thiết lập quyền mặc định

- `umask` là một lệnh trong Linux dùng để thiết lập quyền mặc định khi tạo file và thư mục mới.

tại sao lại cần nó?
Ví dụ bạn tạo 2 file:
```
touch file1.txt
touch file2.txt
```

Bạn muốn file mới tạo ra mặc định:

- Chủ sở hữu được đọc và ghi.
- Nhóm chỉ được đọc.
- Người khác chỉ được đọc.

Thay vì mỗi lần tạo file lại chạy `chmod`, bạn thiết lập `umask` một lần.
tức là tuy theo số sẽ trừ đi cái trong cái quyền được umask
cú pháp:
``` bash
umask [số]
```
- Xem quyền mặc định hiện tại.
``` bash
umask
```
- lúc đầu chúng ta tạo file 
```bash
touch file.txt
```
- mặc định đc cấp quyền ban đầu là 666

- nhưng nếu đặt
```bash
umask 022
```

```
644 (rw-r--r--)
```