# 10 - 10 - 2026
## 1.điều kiện trong bash
- giống như các ngôn ngữ lập trình khác - bash cx có các câu lệnh if -elseif - else nhưng được trình bày khác biệt
```bash
num=5
if [ $num -gt 10 ]; then
 echo "so nay lon hon 10"
fi
```
### phân tích cấu trúc

> if `[ dieu kien ]`; then
>  cong viec trong dieu kien
>  fi

- Điều kiện được đặt trong dấu ngoặc vuông và câu lệnh kết thúc bằng dấu phẩy , được viết ngược lại, đánh dấu sự kết thúc của khối lệnh if.`[ ]` `fi` `if`
## 2. if - else

Câu lệnh if...else cung cấp một cách để thực thi một khối mã nếu điều kiện đúng và một khối mã khác nếu điều kiện sai.

Từ `else` giới thiệu khối lệnh thay thế, và câu lệnh kết thúc bằng dấu chấm `fi`.

```bash
num=5
if [ $num -gt 10 ]; then
 echo "so nay lon hon 10"
else
 echo "so nay nho hon 10"
fi
```

## 3. elif

Câu lệnh ELIF cho phép bạn kiểm tra nhiều điều kiện theo trình tự. Nếu điều kiện đầu tiên sai, điều kiện tiếp theo sẽ được kiểm tra.

 `elif`viết tắt cho "else if" (nếu như), và câu lệnh vẫn kết thúc bằng dấu chấm `fi`.


```bash
num=5
if [ $num -gt 10 ]; then
 echo "so nay lon hon 10"
elif [ $num -eq 10 ]; then
 echo " so nay bang 10"
else
 echo "so nay nho hon 10"
fi
```

## 4. if lồng nhau

- cho phép đặt câu lệnh `if` bên trong của 1 `if`
- mỗi `if` phải kết thúc = `fi`

```bash
num=5
if [ $num -gt 0 ]; then
 if [ $num -lt 10 ]; then
  echo "so nay nam tu 1 den 9"
  fi
fi
```