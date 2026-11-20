## 1.DISK QUOTA LÀ GÌ?
- là cơ chế cho phép admin giới hạn tài nguyên mà user - group được dùng
- có thể giới hạn 2 loại tài nguyên:
- block (dung lượng): tổng dung lượng data mà User/Group đc dùng 1 block=1kb
- inode (số tập tin): tổng số file,folder mà user / group đc tạo

- đc tính dựa trên owner của file đối vs user quota và group owner
## 2. các chính sách trong quota

| thông số                         | ý nghĩa                                                                                                                  |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| giới hạn mềm (soft limit)        | ngưỡng cảnh báo, đc phép vượt trong 1 khoảng thời gian, ko đc vượt hard limit, giá trị 0 = ko giới hạn                   |
| giới hạn cứng (hard limit)       | ngưỡng tuyệt đối, khi chạm vào - hệ thống từ chối ghi dữ liệu  vs lõi là disk quota exceeded. giá trị 0 như trên         |
| thời gian gia hạn (grace period) | thời gian user đc phép ở trạng thái limit soft, mặc định là 7 ngày. hết thời gian = hard limit - ko thể ghi thêm dữ liệu |
## 3. lệnh quan trọng

|Lệnh|Chức năng|
|---|---|
|`quotacheck`|Quét hệ thống tập tin và tạo/cập nhật dữ liệu quota (`aquota.user`, `aquota.group`)|
|`quotaon`|Bật tính năng quota trên hệ thống tập tin|
|`quotaoff`|Tắt tính năng quota trên hệ thống tập tin|
|`edquota -u user`|Chỉnh sửa quota của user|
|`edquota -g group`|Chỉnh sửa quota của group|
|`edquota -t`|Chỉnh sửa thời gian grace period|
|`setquota`|Thiết lập quota bằng dòng lệnh, phù hợp viết script|
|`quota`|Xem quota và mức sử dụng của user/group|
|`repquota`|Báo cáo, thống kê quota của tất cả user/group trên hệ thống tập tin|
|`warnquota`|Gửi cảnh báo qua email cho user vượt soft limit|

## 4. Cú pháp và ví dụ các lệnh

> [!info] Thay giá trị mẫu trước khi chạy
> Trong các ví dụ, `/dev/sda1` là phân vùng và `/mnt/data` là điểm mount. Hãy thay bằng thông tin thực tế trên máy. Các lệnh quản trị thường cần chạy với `sudo`.

### `quotacheck` — quét và khởi tạo dữ liệu quota

**Cú pháp:**
```bash
sudo quotacheck [tùy_chọn] <điểm_mount>
```

**Ví dụ — quét và tạo dữ liệu quota cho user và group:**
```bash
sudo quotacheck -cug /mnt/data
```

`-c` tạo các tệp quota nếu chưa có; `-u` và `-g` lần lượt xử lý quota user và group. Tránh chạy quét trên hệ thống tập tin đang có hoạt động ghi dữ liệu nếu hướng dẫn của bản phân phối yêu cầu unmount hoặc mount chỉ đọc.

### `quotaon` — bật quota

**Cú pháp:**
```bash
sudo quotaon [tùy_chọn] <điểm_mount>
```

**Ví dụ — bật quota user và group:**
```bash
sudo quotaon -vug /mnt/data
```

### `quotaoff` — tắt quota

**Cú pháp:**
```bash
sudo quotaoff [tùy_chọn] <điểm_mount>
```

**Ví dụ — tắt quota user và group:**
```bash
sudo quotaoff -vug /mnt/data
```

### `edquota` — chỉnh quota bằng trình soạn thảo

**Cú pháp:**
```bash
sudo edquota -u <tên_user>
sudo edquota -g <tên_group>
sudo edquota -t
```

**Ví dụ:**
```bash
sudo edquota -u an
sudo edquota -g dev
sudo edquota -t
```

Lệnh mở trình soạn thảo để chỉnh soft limit, hard limit và grace period. Với `edquota -t`, chỉnh thời gian grace period cho block và inode.

### `setquota` — đặt quota trực tiếp trên dòng lệnh

**Cú pháp:**
```bash
sudo setquota -u <user> <block_soft> <block_hard> <inode_soft> <inode_hard> <điểm_mount>
sudo setquota -g <group> <block_soft> <block_hard> <inode_soft> <inode_hard> <điểm_mount>
```

**Ví dụ — đặt quota cho user `an`:**
```bash
sudo setquota -u an 102400 122880 1000 1200 /mnt/data
```

Các giá trị block tính theo KiB: ví dụ trên đặt soft/hard lần lượt là 100 MiB/120 MiB. Hai giá trị tiếp theo là soft/hard limit cho số inode. Đặt giá trị `0` để không giới hạn loại tài nguyên tương ứng.

### `quota` — xem quota của user hoặc group

**Cú pháp:**
```bash
quota -u <tên_user>
quota -g <tên_group>
```

**Ví dụ:**
```bash
quota -u an
quota -g dev
```

### `repquota` — xem báo cáo quota

**Cú pháp:**
```bash
sudo repquota [tùy_chọn] <điểm_mount>
```

**Ví dụ — báo cáo quota user và group:**
```bash
sudo repquota -ug /mnt/data
```

### `warnquota` — gửi cảnh báo quota qua email

**Cú pháp:**
```bash
sudo warnquota [tùy_chọn]
```

**Ví dụ — kiểm tra và gửi cảnh báo trên các hệ thống tập tin được cấu hình:**
```bash
sudo warnquota -a
```

Lệnh này cần cấu hình email và quota phù hợp trên hệ thống để gửi được thư.