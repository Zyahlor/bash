## 1. các loại file system

| File system | Đặc điểm | Ứng dụng thường gặp |
|---|---|---|
| **ext2** | Không có journal, đơn giản, nhanh | Phân vùng `/boot` nhỏ, USB |
| **ext3** | ext2 + journal | Hệ thống cũ |
| **ext4** | Journal, hỗ trợ file đến 16 TB, phân vùng đến 1 EB, mặc định của Debian | Phân vùng `/`, `/home`, dữ liệu |
| **XFS** | Hiệu năng cao với file lớn, không thu nhỏ được | Máy chủ dữ liệu lớn |
| **Btrfs** | Snapshot, nén, checksum, RAID tích hợp | Hệ thống cần snapshot |
| **FAT32 (vfat)** | Tương thích nhiều hệ điều hành, file tối đa 4 GB | USB, phân vùng EFI (`/boot/efi`) |
| **exFAT** | Thay FAT32 cho file lớn, cần gói `exfatprogs` | Thẻ nhớ, USB dung lượng lớn |
| **NTFS** | File system của Windows, đọc/ghi qua `ntfs-3g` | Dual-boot, ổ cứng ngoài |
| **swap** | Không chứa file, dùng làm bộ nhớ ảo | Phân vùng swap |
| **ISO9660 / UDF** | File system của đĩa quang | CD/DVD, file ISO |
| **NFS / CIFS (SMB)** | File system mạng | Chia sẻ dữ liệu giữa các máy |
| **tmpfs, proc, sysfs, devtmpfs** | File system ảo, nằm trong RAM/kernel | `/tmp`, `/proc`, `/sys`, `/dev` |

**Journal:** Là nhật ký ghi lại các thay đổi trước khi thực hiện, giúp hệ thống phục hồi nhanh và hạn chế hỏng dữ liệu khi mất điện đột ngột.
## 2. thiết bị trong thư mục /dev 
- trên linux , mọi thứ đều là file, kể cả phần cứng.
- /dev chứa các file thiết bị đại diện cho phần cứng

- Quy tắc đặt tên thiết bị đĩa

| Tên thiết bị | Ý nghĩa |
|---|---|
| `/dev/sda`, `/dev/sdb`, … | Ổ đĩa SATA/SCSI/USB thứ 1, thứ 2, … |
| `/dev/sda1`, `/dev/sda2`, … | Phân vùng 1, 2, … của ổ `sda` |
| `/dev/vda`, `/dev/vdb` | Đĩa ảo VirtIO (KVM/QEMU) |
| `/dev/nvme0n1` | Ổ NVMe số 0, namespace 1 |
| `/dev/nvme0n1p1` | Phân vùng 1 của ổ NVMe trên |
| `/dev/sr0` | Ổ đĩa quang (CD/DVD) |
| `/dev/loop0` | Thiết bị loop (gắn file ảnh như ISO, Snap) |
- Một số file thiết bị đặc biệt khác

| File thiết bị   | Ý nghĩa                               |
| --------------- | ------------------------------------- |
| `/dev/null`     | Hố đen: ghi vào bị bỏ đi, đọc ra rỗng |
| `/dev/zero`     | Sinh ra vô hạn byte 0                 |
| `/dev/random`   | Sinh số ngẫu nhiên                    |
| `/dev/urandom`  | Sinh số ngẫu nhiên                    |
| `/dev/tty`      | Terminal điều khiển hiện tại          |
| `/dev/pts/*`    | Các terminal ảo                       |
| `/dev/mapper/*` | Thiết bị LVM / mã hóa                 |
## 3. Cú pháp và các lệnh thường dùng để quản lý đĩa

### `lsblk`

- **Cú pháp:** `lsblk [-f] [thiết_bị]`
- **Chức năng:** Liệt kê thiết bị khối dạng cây. Tùy chọn:
- `-f` hiển thị thêm loại file system, UUID và điểm mount.
- `-a` hiển thị cả các thiết bi trống
- `-p` hiển thị đường dẫn đầy đủ của thiết bị
- `-m` hiển thị thông tin quyền sở hữu và truy cập
- `-l` hiển thị danh sách phẳng
- `-t` hiển thị thông tin topology
- **Ví dụ:** `lsblk -f`

### `fdisk`

- **Cú pháp:** `fdisk -l [thiết_bị]` hoặc `fdisk thiết_bị`
- **Chức năng:** Xem bảng phân vùng hoặc mở chế độ tương tác để quản lý phân vùng MBR/GPT.
- **Ví dụ:** `sudo fdisk -l /dev/sda`

### `parted`

- **Cú pháp:** `parted thiết_bị print`
- **Chức năng:** Hiển thị bảng phân vùng; công cụ này cũng hỗ trợ quản lý phân vùng trên đĩa lớn.
- **Ví dụ:** `sudo parted /dev/sda print`

### `blkid`

- **Cú pháp:** `blkid [thiết_bị]`
- **Chức năng:** Hiển thị UUID và loại file system của thiết bị.
- **Ví dụ:** `sudo blkid /dev/sda1`

### `mkfs`

- **Cú pháp:** `mkfs -t loại thiết_bị` hoặc `mkfs.ext4 thiết_bị`
- **Chức năng:** Tạo file system trên phân vùng.
- **Ví dụ:** `sudo mkfs.ext4 /dev/sdX1`
- **Lưu ý:** Lệnh này sẽ xóa dữ liệu trên thiết bị đích. Hãy xác nhận đúng thiết bị trước khi chạy.

### `mount`

- **Cú pháp:** `mount [-t loại] [-o tùy_chọn] thiết_bị thư_mục`
- **Chức năng:** Gắn file system vào một thư mục trong cây thư mục.
- **Ví dụ:** `sudo mount /dev/sdX1 /mnt/data`

### `umount`

- **Cú pháp:** `umount thư_mục` hoặc `umount thiết_bị`
- **Chức năng:** Gỡ file system khỏi hệ thống.
- **Ví dụ:** `sudo umount /mnt/data`

### `df`

- **Cú pháp:** `df -hT [đường_dẫn]`
- **Chức năng:** Xem dung lượng đã dùng và còn trống của file system đang mount.
- `-h` hiển thị đơn vị dễ đọc,
- `-T` hiển thị loại file system.
- **Ví dụ:** `df -hT`

### `du`

- **Cú pháp:** `du -sh thư_mục`
- **Chức năng:** Xem tổng dung lượng thư mục đang chiếm. `-s` lấy tổng, `-h` hiển thị đơn vị dễ đọc.
- **Ví dụ:** `du -sh ~/Downloads`

### `findmnt`

- **Cú pháp:** `findmnt [thư_mục]`
- **Chức năng:** Hiển thị các file system và điểm mount dưới dạng cây.
- **Ví dụ:** `findmnt /mnt/data`

### `fsck`

- **Cú pháp:** `fsck [-f] thiết_bị`
- **Chức năng:** Kiểm tra và sửa lỗi file system.
- **Ví dụ:** `sudo fsck -f /dev/sdX1`
- **Lưu ý:** Gỡ mount phân vùng trước khi kiểm tra; không chạy trên file system đang được sử dụng.

### `partprobe`

- **Cú pháp:** `partprobe [thiết_bị]`
- **Chức năng:** Yêu cầu kernel đọc lại bảng phân vùng.
- **Ví dụ:** `sudo partprobe /dev/sda`
### `quotackeck`

- quét hệ thống tệp và kiểm tra thông tin quota
- cú pháp: `quotacheck` `[thuộc tính]` `[đường dẫn thư mục]`
- tham số:
- `-c` tạo tệp cớ sở dữ liệu quota mới
- `-u` kiểm tra quota của user
- `-g` kiểm tra quota của group
### `quotaon`
- bật tính năng quota
- cú pháp: `quotaon` `[thuộc tính]` `[đường dẫn]`
- `-v` hiển thị thông tin chi tiết
- `-u` bật quota cho user
- `-g` bật quota cho group
### `edquota`
- chỉnh sủa hạn mức
- cú pháp: `edquota` `[thuộc tính]` `[user]`
- `-u` chỉ định đối tượng là user
- `-g` chỉ định group
- `-p` sao chép hạn mức quota từ 1 user mẫu
### `requota`
- tạo báo cáo thông kê quota
- cú pháp: `repquota` `[thuộc tính]` `[đường dẫn]`
- `-u` báo cáo quota của user
## 4 Các tệp cấu hình quan trọng

| Tệp | Chức năng |
|---|---|
| `/etc/fstab` | Danh sách phân vùng được mount tự động khi khởi động |
| `/proc/partitions` | Danh sách phân vùng kernel đang nhận |
| `/proc/mounts` | Danh sách file system đang được mount |
| `/etc/mtab` | Thông tin các file system đang được mount |

- Cấu trúc một dòng trong `/etc/fstab`

**Cú pháp:**

```bash
<thiết_bị/UUID> <điểm_mount> <loại_FS> <tùy_chọn> <dump> <fsck>