# 09 - 10 - 2026
## 1. BASH SCRIPTING LÀ GÌ?
- là tập file `.sh` chứa các lệnh mã lệnh tự đồng các tác vụ công viêc 
- khởi đầu 1 file bash scripting là dòng gọi `#!/bin/bash` - gọi đến bash trong folder bin - bin chứa các lệnh thực thi hệ thống vs sbin
- trên linux có rất nhiều loại shell script - chuẩn hóa chúng ta sài bash
## 2. viết chương trình đầu tiên

``` bash
#!/bin/bash
# dây là comment
echo "hello, world!" # lệnh xuất ra màn hình hello,world!
``` 

## 3. [[variable]] trong bash scripting
1.  biến lữu trữ dữ liệu của bạn, gán giá trị bằng cách sử dụng `=` **không có khoảng chắn/cách**
- dùng biến đã tạo thì phải dùng dấu `$` trước biến

```bash
#!/bin/bash
name="world"
echo "hello,$name"
```
2. biến môi trường: là biến đặc biệt ảnh hưởng đến các tiến trình hoạt động trên hệ thống
- thường được dùng để lưu trữ các giá trị toàn hệ thống
- ví dụ - vị trí của các tệp thực thi, tình soạn thảo mặc định
```bash
echo " path cua ban $PATH"
```
3. biến cục bộ và toàn cục
- cục bộ chỉ dùng trong 1 khối lệnh
- toàn cục có thể dùng bất kỳ đâu
- như các ngôn ngữ lập trình khác như  C,C++,Python
- ví dụ biến cục bộ
```bash
fc(){
local mss="day la bien cuc bo!"
echo $mss
}
fc
```

## 4. các phép toán thông thường
- biến dùng trong nhiều phép toán khác nhau, chẳng hạn như nối chuỗi, phép toán học số
- nối chuỗi: kết hợp các chuỗi bằng cách sử dụng biến
- số học: tính toán như bình thường
```bash
# noi chuoi
m="hello"
n="world"
echo "$m$n" #output = helloworld
#toan hoc
num1=2
num2=3
sum=$((num1+num2))
echo "the sum is $sum" #output = 5
```