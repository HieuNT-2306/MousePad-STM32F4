# Bàn di chuột tương tác
![513755038_1010289724286876_7558647611801862440_n](https://github.com/user-attachments/assets/f32116e3-b7fc-4edf-87b2-33734de13e75)

# Mô tả dự án
MousePad-STM32F4 là một dự án nhúng sử dụng board STM32F429I-Discovery để tạo ra một bàn di chuột (touchpad) với các tính năng sau:

- Sử dụng màn hình cảm ứng tích hợp để điều khiển con trỏ chuột.

- Gửi dữ liệu chuột qua giao thức USB HID (Human Interface Device).

- Hỗ trợ vẽ vòng tròn trên màn hình khi chạm.

- Tích hợp nút PA0 để gửi sự kiện click chuột.

# Yêu cầu phần cứng
- Board: STM32F429I-Discovery.

- Cáp: Micro-USB (cho ST-Link) và USB OTG (cho HID).

- Nguồn điện: Nguồn từ cáp USB.

# Yêu cầu phần mềm
- STM32CubeIDE: Phiên bản 1.18.0 hoặc cao hơn.

- Thư viện: STM32CubeF4 (có thể tải từ STMicroelectronics).

- Thư viện quan trọng: 

  usb_device.h:	Khởi tạo và cấu hình USB Device
  
  stm32f429i_discovery_sdram.h:	Quản lý bộ nhớ SDRAM ngoài
  
  stm32f429i_discovery_ts.h:	Đọc cảm ứng (tọa độ touch)
  
  stm32f429i_discovery_lcd.h:	Vẽ lên LCD (giao diện)
  
  usbd_hid.h: Xử lý giao tiếp USB HID (gửi dữ liệu chuột)

# Hoạt động:
- Chạm vào màn hình để di chuyển con trỏ chuột trên máy tính.

- Nhấn nút PA0 để thực hiện click chuột.

- Vẽ vòng tròn trên màn hình khi chạm (tùy cấu hình TouchGFX).

# Tổng quan dự án 
## 1. Cấu trúc dự án
Dựa trên thông tin bạn chia sẻ và cấu trúc điển hình của STM32CubeIDE, dự án có thể bao gồm các thư mục chính như sau:

- Core/: Chứa các file mã nguồn chính như main.c, stm32f4xx_it.c, và stm32f4xx_hal_msp.c. Đây là nơi xử lý logic chính, bao gồm khởi tạo phần cứng và vòng lặp chính.

- Drivers/: Chứa thư viện STM32CubeF4 (HAL, CMSIS), cung cấp các hàm cấp thấp để giao tiếp với phần cứng như GPIO, USB, và touch controller STMPE811.

- TouchGFX/: Chứa mã liên quan đến giao diện đồ họa (GUI), bao gồm các file như Screen1View.cpp hoặc TouchGFXConfiguration.cpp, để vẽ vòng tròn và xử lý sự kiện chạm.

- USB_DEVICE/: Chứa các file như usbd_conf.c và usbd_hid.c, xử lý giao thức USB HID để gửi dữ liệu chuột.

- Inc/ và Src/: Chứa các header và file nguồn bổ sung, có thể bao gồm cấu hình cho PA0 (ngắt).

## 2. Phân tích chức năng chính
Dựa trên mô tả, dự án có các thành phần chính sau:
### a. Khởi tạo phần cứng
#### Trong main.c, hàm MX_ (do STM32CubeMX generate) khởi tạo các ngoại vi:
- RCC và Clock: Cấu hình HCLK = 180 MHz để hỗ trợ USB (cần 48 MHz).

- GPIO PA0: Cấu hình làm ngắt (EXTI) để phát hiện nhấn nút.

- USB_OTG_FS: Khởi tạo ở chế độ Device với lớp HID.

- Touch Controller (STMPE811): Cấu hình để đọc tọa độ chạm từ màn hình.

- TouchGFX: Khởi tạo giao diện đồ họa.
### b. Xử lý sự kiện chạm
#### File trong TouchGFX/ (như Screen1View.cpp) xử lý sự kiện từ STMPE811:
- Khi chạm, tọa độ (x, y) được lấy và chuyển đổi thành dữ liệu di chuyển chuột (delta X, delta Y).

- Hàm vẽ vòng tròn có thể được gọi bằng cách sử dụng API của TouchGFX (như CanvasWidget), với bán kính và màu sắc tùy chỉnh.
#### Dữ liệu di chuyển được gửi qua USB HID trong hàm USBD_HID_SendReport.
### c. Giao thức USB HID
#### File usbd_hid.c định nghĩa cấu trúc báo cáo HID (Mouse Report Descriptor):
- Bao gồm các trường: buttons (1 byte), x (byte), y (byte).

- Hàm USBD_HID_SendReport được gọi định kỳ (thường 10ms) để gửi dữ liệu tới máy tính.
#### usbd_conf.c cấu hình USB_OTG_FS với buffer và callback.
## 3. Luồng chương trình
#### Vòng lặp chính (main.c):
- Gọi MX_ để khởi tạo.

- Sử dụng HAL_Delay để tạo khoảng thời gian gửi HID.

- Kiểm tra ngắt PA0 và cập nhật trạng thái chuột.
#### Ngắt (ISR):
Xử lý chạm từ STMPE811 và nhấn PA0, sau đó gọi hàm gửi HID.
#### TouchGFX:

# Nhóm sinh viên thực hiện
- Nguyễn Trung Hiếu - MSSV: 20215578
  
- Trần Đức Lương - MSSV: 20215612
  
- Vũ Văn Thăng - MSSV: 20215643

# Tài liệu tham khảo
- STM32CubeIDE User Manual: STM32CubeIDE.

- STM32CubeF4: STM32CubeF4.



