# AppleZone - Spring MVC

## Xây dựng website bán các sản phẩm của Apple

### Mô tả: Hỗ trợ người dùng có thể mua hàng trực tuyến một cách dễ dàng, tích hợp thanh toán trực tuyến và phân quyền người dùng, bảo mật thông tin người dùng...

## Công nghệ sử dụng

-   Frontend: HTML, CSS, JavaScript
-   Backend: Spring MVC, Spring JDBC Template, JSP, SQL Server

## Một số hình ảnh của dự án:

![image](https://github.com/user-attachments/assets/75c33f54-50a6-4617-8e22-6f71bbcfd717)
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

## Yêu cầu môi trường

-   JDK 11
-   Maven 3.x
-   Apache Tomcat 9/10 (tương thích Servlet 4.0)
-   SQL Server

Kiểm tra phiên bản:

```bash
java -version
mvn -v
```

Trên Windows (Git Bash), để set `JAVA_HOME` tạm thời:

```bash
export JAVA_HOME="C:/Program Files/Java/jdk-11"
export PATH="$JAVA_HOME/bin:$PATH"
```

## Tổng quan cấu trúc & cấu hình quan trọng

-   Artifact type: `war` (xem `pom.xml`)
-   Dispatcher servlet: `src/main/webapp/WEB-INF/web.xml`
-   Spring web config: `src/main/webapp/WEB-INF/applezone-config-servlet.xml`
-   DataSource (mặc định) trong `applezone-config-servlet.xml`:
    -   JDBC URL: `jdbc:sqlserver://localhost:1433;databaseName=db_name;encrypt=true;trustServerCertificate=true`
    -   username: `...`
    -   password: `...`

> Lưu ý: cấu hình DB nằm trực tiếp trong file XML. Nếu bạn không dùng SQL Server hoặc thông tin đăng nhập khác, chỉnh file này trước khi build/deploy.

## Chuẩn bị database

1. Bật SQL Server và đảm bảo có thể kết nối từ máy local (cổng 1433).
2. Tạo database tên `QuanLyBanHang` hoặc thay `databaseName` trong `applezone-config-servlet.xml` thành database bạn có.
3. Tạo các bảng cần thiết (import script nếu có).

## Build project (tạo WAR)

Tại root của project (nơi có `pom.xml`) chạy:

```bash
mvn clean package -DskipTests
```

## Deploy lên Apache Tomcat (khuyến nghị)

1. Copy WAR vào thư mục Tomcat `webapps/`:

```bash
# Windows (Git Bash)
cp target/*.war "$TOMCAT_HOME/webapps/"
```

2. Start Tomcat:

```bash
cmd.exe /C "%TOMCAT_HOME%\\bin\\startup.bat"
```

3. Mở trình duyệt: `http://localhost:8080/AppleZone/` (tùy tên WAR; đổi thành `ROOT.war` để chạy ở `/`).

## Chạy trong IDE (IntelliJ / Eclipse / STS)

1. Import project as Maven project.
2. Cấu hình Tomcat server trong IDE.
3. Add artifact (WAR/exploded) vào server, Run/Debug.

## Chạy nhanh bằng Maven (tuỳ chọn)

`pom.xml` hiện không chứa plugin embedded. Nếu muốn chạy bằng Maven, thêm plugin như `jetty-maven-plugin` hoặc `tomcat7-maven-plugin` vào `pom.xml` rồi chạy `mvn jetty:run` hoặc `mvn tomcat7:run`.

Rồi chạy:

```bash
mvn jetty:run -DskipTests
```

## Thông tin cấu hình view & static

-   View resolver: prefix `/WEB-INF/views/`, suffix `.jsp` (xem `applezone-config-servlet.xml`).
-   Static resources: `/assets/**` → `/assets/` trong webapp.
