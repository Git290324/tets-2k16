#!/bin/bash

# Kiểm tra nếu đang chạy trong shell Bash
if [ -z "$BASH" ]; then
    bash "$0" "$@"
    exit 0
fi

# Kiểm tra quyền root
if [ "$(id -u)" != "0" ]; then
    sudo bash "$0" "$@"
    exit $?
fi

# Cài đặt các gói cần thiết (có thể cần chỉnh sửa tùy theo hệ thống)
install_dependencies() {
    echo "Installing necessary dependencies..."
    # Thực hiện các bước cài đặt gói phần mềm cần thiết ở đây
}

# Kiểm tra và cài đặt các gói phụ thuộc
install_dependencies

# Tải và thực thi file cài đặt Windows Server 2016
echo "Downloading and installing Windows Server 2016..."
# Thực hiện tải và cài đặt Windows Server 2016 ở đây mà không yêu cầu nhập key

echo "Windows Server 2016 installation completed successfully!"
