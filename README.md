# AppleZone - Website Bán Hàng Apple (Spring MVC)

Dự án website thương mại điện tử chuyên kinh doanh các sản phẩm của Apple, được xây dựng dựa trên nền tảng Java Spring MVC. Hệ thống hỗ trợ đầy đủ các quy trình mua sắm trực tuyến từ phía người dùng và quản lý từ phía quản trị viên.

## 🚀 Tính năng chính

### Người dùng (User)

-   **Trang chủ**: Hiển thị sản phẩm nổi bật, khuyến mãi, danh mục sản phẩm.
-   **Sản phẩm**: Xem chi tiết sản phẩm, thông số kỹ thuật, hình ảnh.
-   **Giỏ hàng**: Thêm/sửa/xóa sản phẩm trong giỏ hàng.
-   **Thanh toán**: Quy trình đặt hàng và thanh toán trực tuyến.
-   **Tài khoản**: Đăng ký, đăng nhập, bảo mật thông tin cá nhân.

### Quản trị viên (Admin)

-   **Dashboard**: Tổng quan hệ thống.
-   **Quản lý sản phẩm**: Thêm, sửa, xóa, cập nhật thông tin sản phẩm.
-   **Quản lý đơn hàng**: Xem và xử lý đơn hàng.

## 🛠 Công nghệ sử dụng

-   **Backend**: Spring MVC, Spring JDBC Template, Spring Security
-   **Frontend**: JSP, HTML5, CSS3, JavaScript, SiteMesh
-   **Database**: SQL Server
-   **Build Tool**: Maven

## ⚙️ Yêu cầu môi trường

-   **Java Development Kit (JDK)**: Phiên bản 11.
-   **Maven**: 3.x.
-   **Database**: SQL Server.
-   **Web Server**: Apache Tomcat 9 hoặc 10.

## 📦 Cài đặt và Chạy dự án

### 1. Cấu hình Cơ sở dữ liệu

1.  Tạo database tên `QuanLyBanHang` trong SQL Server.
2.  Restore file backup từ đường dẫn: `database/QuanLyBanHang.bak`.
3.  Cấu hình thông tin kết nối database trong file:
    `src/main/webapp/WEB-INF/applezone-config-servlet.xml`

    Tìm đến bean `dataSource` và cập nhật `username`, `password` của bạn:

    ```xml
    <bean id="dataSource" class="com.zaxxer.hikari.HikariDataSource" destroy-method="close">
        <property name="driverClassName" value="com.microsoft.sqlserver.jdbc.SQLServerDriver" />
        <property name="jdbcUrl" value="jdbc:sqlserver://localhost:1433;databaseName=QuanLyBanHang;encrypt=true;trustServerCertificate=true" />
        <property name="username" value="sa" /> <!-- Thay đổi username -->
        <property name="password" value="123" /> <!-- Thay đổi password -->
        ...
    </bean>
    ```

### 2. Build dự án

Mở terminal tại thư mục gốc của dự án và chạy lệnh:

```bash
mvn clean install
```

### 3. Chạy trên Tomcat

-   Add dự án vào Tomcat Server trong IDE (Eclipse/IntelliJ/VS Code).
-   Start Server.
-   Truy cập: `http://localhost:8080/AppleZone` (hoặc port/context path bạn cấu hình).

## 📸 Một số hình ảnh của dự án

![image](https://github.com/user-attachments/assets/37988efc-a0b9-4d27-bf77-b5031fc2e201)
![image](https://github.com/user-attachments/assets/053f7694-157a-436e-ab87-679a0d7fe31d)
![image](https://github.com/user-attachments/assets/cf186451-984f-4ce4-8105-f3286c2df573)
![image](https://github.com/user-attachments/assets/8cddba15-1988-4090-8d1c-1a0d974e667a)
![image](https://github.com/user-attachments/assets/126ddc4c-88ad-44e3-b072-eaf9f8b6df81)
![image](https://github.com/user-attachments/assets/6c603ee3-7ec4-4a3d-b7df-13f1cb3be159)
![image](https://github.com/user-attachments/assets/e895a4a9-8bc4-4fd1-9b2b-e54631262904)
![image](https://github.com/user-attachments/assets/875955c2-8ca0-44e5-8b9b-f0c440af58ee)
![image](https://github.com/user-attachments/assets/879443e4-b964-49d9-b321-56c3e3728a49)
![image](https://github.com/user-attachments/assets/2bf17baa-91df-41bf-9f3d-3745b222abb8)

## 📂 Cấu trúc dự án

```
AppleZoneProject/
├── database/               # File backup CSDL (.bak)
├── src/
│   ├── main/
│   │   ├── java/           # Source code Java (Controller, Service, Dao, Entity...)
│   │   └── webapp/         # Web resources
│   │       ├── assets/     # CSS, JS, Images
│   │       ├── WEB-INF/    # Configuration (web.xml, spring configs) & Views (JSP)
└── pom.xml                 # Maven dependencies
```
