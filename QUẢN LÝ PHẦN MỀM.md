có nhiều quản lý gói hệ thống khác nhau vì có nhiều distro linux quá, đang học debian nên chỉ quan tâm tới của debian thôi

## 1. dpkg
- công cu cấp thấp
- cài,gỡ,truy vấn file.deb cụ thể, không tự xử lý phụ thuộc
- thuộc tính:
- -i - cài gói
- -r - gỡ gói
- -P - gỡ phần mềm và cấu hình
- -l liệt kê các gói
- -s xem thông tin
- -L xem vị trí file của gói
-  `--audit` xem các gói ở trạng thái lỗi
- `--configure` `-a` cấu hình lại cho các gói chưa cấu hình
- 
``` bash

sudo dpkg -thuoctinh ten_goi.deb
```

## 2. apt
- là công cụ quản lý và cài đặt phần mềm trên debian,ubuntu,kali
- khác dpkg,apt tự động tải và xử lý các gói phụ thuộc(dependencies)
### các lệnh cơ bản

``` bash
sudo apt [command]
```
- update - cập nhập danh sách gói từ kho phần mềm
- upgrade - nâng cấp các gói phần mềm đã cài
- full-upgrade - nâng cấp hệ thống và gỡ 1 số gói nếu cần
- install ten_goi - cài phần mềm có thể cài nhiều 1 lúc
- remove ten_goi - gỡ phần mềm không xóa cấu hình
- purge - xóa cả cấu hình lẫn gói
- autoremove - xóa các gói phụ thuộc ko dùng nữa
- search ten_goi - tìm tên gói
- show ten_goi - xem thông tin
- clean - xóa bộ nhớ đệm tải xuống
- autoclean - xóa gói cũ ko còn tải được từ kho
## 3. biến thể của apt
### 1. apt-get

- tương tự như apt thường
- Các lệnh và thuộc tính

|Lệnh|Chức năng|
|---|---|
|`apt-get update`|Cập nhật danh sách gói|
|`apt-get upgrade`|Nâng cấp gói|
|`apt-get install`|Cài đặt gói|
|`apt-get remove`|Gỡ phần mềm|
|`apt-get purge`|Gỡ phần mềm và cấu hình|
|`apt-get autoremove`|Xóa phụ thuộc không cần thiết|
|`apt-get clean`|Xóa cache tải xuống|
|`apt-get autoclean`|Xóa cache gói cũ|
|`apt-get dist-upgrade`|Nâng cấp hệ thống, có thể thay đổi phụ thuộc|
-  Một số tùy chọn quan trọng

|Thuộc tính|Ý nghĩa|
|---|---|
|`-y`|Tự động đồng ý|
|`-s`|Mô phỏng thao tác|
|`-f`|Sửa lỗi phụ thuộc|
|`-d`|Chỉ tải gói, không cài|
|`--reinstall`|Cài đặt lại gói|
|`-q`|Giảm thông tin hiển thị|
|`-V`|Hiển thị phiên bản gói|
### 2.apt-cache

- dùng đẻ truy vấn thông tin trong bộ nhớ đệm dữ liệu gói của apt
- Các lệnh thường dùng

|Lệnh|Chức năng|
|---|---|
|`apt-cache search`|Tìm kiếm gói|
|`apt-cache show`|Xem thông tin gói|
|`apt-cache policy`|Xem phiên bản và nguồn gói|
|`apt-cache depends`|Xem gói phụ thuộc|
|`apt-cache rdepends`|Xem gói phụ thuộc ngược|
|`apt-cache showpkg`|Hiển thị thông tin chi tiết gói|
|`apt-cache stats`|Thống kê bộ nhớ đệm|
## 4. cài đặt phần mềm từ mã nguồn
- dùng khi bản mới nhất chưa có trên kho hoặc chỉ có ở dạng mã nguồn
#### các bước
1. cài công cụ cần thiết để biên dịch build-essential sau khi cài ko cần làm lại cái bước này
2. tải mã nguồn
3. giải nén
4. cấu hình trc khi biên dịch ./configure
5. biên dịch mã nguồn - make
6. cài vào hệ thống - make install
7. kiểm tra kết quả