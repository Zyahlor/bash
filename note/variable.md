# 09 - 10 - 2026
## 1. string
- chuỗi ký tự là dãy ký tự dùng để lưu trữ văn bản,có thể thao tác bằng nhiều phép toán trên chuỗi như nối hoặc trích xuất chuỗi con
```bash
# String example 
greeting="Hello, World!"
name="Alice" 
full_greeting="$greeting, $name!" 
echo $full_greeting
```

## 2. số
- được sử dụng cho các phép toán số học, hỗ trợ phép toán số nguyên tự nhiên - `+` , `-` , `/` , `*`
```bash
num1=5
num2=10
sum=$((num1 + num2)) 
difference=$((num2 - num1)) 
product=$((num1 * num2)) 
quotient=$((num2 / num1)) 
echo "Sum: $sum, Difference: $difference, Product: $product, Quotient: $quotient"
```
## 3. mảng
- dùng để lưu trữ nhiều giá trị trong 1 biến duy nhất, mỗi phần tử truy cập = `index` 

```bash
fruits=("apple","banana","cherry")
for fruit in "${fruits[@]}"; do
 echo $fruit
done
```
- mảng liên kết: dùng các khóa có tên truy cập các giá trị, tương tự như dictionary trong python,...
- có thể thêm, xóa giá trị và khóa
```bash
declare -A colors
colors[apple]="red"
color[banana]="yellow"
coloer[grape]="purple"
unset colors[banana]
echo ${colors[apple]}
echo ${colors[grape]}
```