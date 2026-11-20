# 1. thao tác tập tin
## 1. TOUCH
tạo file rỗng: touch [name_file]
## 2. CAT
xem nội dung: cat [name_file]
- thuộc tính:
+ -n đánh số tất cả các dòng
+ -b đánh số các dòng rỗng
+ -s gộp các dòng trống liên tiếp
+ >> = thêm nội dung vào cuối, > ghi mới luôn nội dung
vd:
cat -n file.txt
cat file1.txt file2.txt
cat file1.txt > file2.txt

## 3. XEM DANG TRANG - MORE,LESS
xem nội dung từng trang: more [name_file]
xem nội dung,cuộn được: less [name_file]
## 4. HEAD-TAIL
xem số dòng đầu: head [số] [name_file]
xem số dòng cuối: taill [số] [name_file]
- thống số của tail và head như nhau
- thông số:
+ -n - dùng để xem số dòng
+ -f - chỉ dùng cho tail - theo dõi tập tin liên tục
## 5. COPY -CP
sao chép: cp [path nguồn] [path đích]
- thuộc tính:
+ -r - sao chép thư mục và nội dung bên trong
+ -i - hỏi trước khi ghi đè
+ -f ép buộc sao chép
+ -v hiển thị quá trình sao chép
+ -p giữ nguyên thuộc tính tập tin

vd:
cp -r folder1 folder2
cp -i file1.txt file2.txt
cp -v file1.txt /home/

## 6. DI CHUYỂN - MV
di chuyển: mv [path nguồn] [path đích]
- thuộc tính:
+ -i - hỏi trc khi ghi đè
+ -f ép buộc di chuyển
+ -v hiển thị quả trình thực hiện
+ -n không ghi đè tập tin đã tồn tại
vd:
mv file.txt /home/
mv file1.txt file2.txt
mv -i file.txt /home/
## 7. XÓA FILE  - RM
xóa file: rm [name_file]
- thuộc tính:
+ -r - xóa thư mục và nội dung bên trong
+ -f xóa không hỏi xác nhận
+ -i hỏi trước khi xóa
+ -v hiển thị tập tin đang bị xóa
vd:
rm file.txt
rm -r folder
rm -i file.txt
## 8. XÁC ĐỊNH LOẠI TẬP TIN - FILE
xác định loại tập tin: file [name_file]
- thông số:
+ -i - hiển thị kiểu tệp dưới dạng chuỗi MIME chuẩn (ví dụ: text/plain; charset=utf-8).
+ -b -  hiển thị kết quả kiểu tệp, ẩn tên tệp ở đầu dòng để dễ dùng trong lập trình script.
+ -z - Thử nhìn vào bên trong các tệp đã nén (như .gz, .z) để kiểm tra kiểu tệp gốc bên trong.
+ -f - • Đọc danh sách các tệp cần kiểm tra từ một tệp văn bản khác.
## 9. ĐẾM - WC
đếm dòng - từ -ký tự: wc [ten_file]
- thông số:
+ -l - dếm dòng
+ -w - đếm từ
+ -c - đếm số lượng byte
+ -m đếm số lượng kí tự
+ -L - hiện đội dài của dòng dài nhất - tính bằng số kí tự
## 10.TÌM KIẾM FILE - FIND
tìm kiếm: find [path cần tìm] -name [name_file]
- tìm theo name

+ -name: tìm chính xác tên
+ -iname: không phân biệt hoa thường
- tìm theo loại

+ -f - loại tệp => d = thư mục , f => file
- theo kích thước

+ + = lớn hơn hoặc bằng
+ - = bé hơn hoặc bằng
+ đơn vị: k(kb),m(mb),g(gb)
- theo thời gian

+ -mtime: thời gian sửa theo ngày vd -mtime -2 hoặc +2
[!] mở rộng của find - kết hợp hành động
- exec - thực thi lệnh
- Tìm tất cả file .log và đổi quyền truy cập (chmod) thành 644
find /var/log -name "*.log" -exec chmod 644 {} \;

({} => chính file đc tìm, \ => end exec)

- delete - xóa file
- tìm theo -user, -group 
## 11. nén và giải nén
1. nén
``` bash
tar -thuoc_tinh [name_gz/bz2/xz] [file]
```
- thuộc tính:
- -c tạo tập tin nén
- -x giải nén
- -t - xem nôi dung tập tin nén
- -v - hiển thị chi tiết quá trình
- -f - chỉ định tên tập tin
- -z - dùng cho gzip(.tar.gz)
- -j - dùng cho bzip2(.tar.bz2)
- -J - dùng cho xz(.tar.xz)

1. giải nén
``` bash
tar -x+thuoctinh [name_tar_gz/bz2/xz]
nếu muốn giải nén vào thư mục nào đó thêm -C sau name_tar_.. và thêm đường dẫn
 tar -x+thuộc_tính [name_tar_..] -C path
```
# 2.THAO TÁC THƯ MỤC

## 1. PWD 
- xem đường dẫn hiện hành
## 2. LS 
- liệt kê tập tin
- thuộc tính:
- l - hiển thị chi tiết
- a - hiển thị tập tin ẩn
- h hiển thị dung lượng dễ đọc
- R - liệt kê cả thư mục con
- -t sắp theo thời gian sửa đổi
- -s sắp theo dung lượng
## 3. MKDIR
- tạo thư mục
- thuộc tính:
- p - tạo thư mục cha nếu chưa tồn tại
- v  - hiển thị thông báo khi tạo
# 4. tìm kiếm và kiểm tra tập tin
## 1. GREP
- tìm kiếm nội dung
``` bash
grep "chuoi" [name_file]
```
- thuộc tính:
- -i - không phân biệt chữ hoa thường
- -n - hiển thị dòng
- -w - tìm từ khớp hoàn chỉnh
- -v - đảo ngược kết quả - tức hiện những dòng ko chứa chuỗi
- -c - đếm số dòng khớp
- -l - hiển thị tên tập tin có kết quả 