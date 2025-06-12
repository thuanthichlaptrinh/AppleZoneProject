document.addEventListener('DOMContentLoaded', () => {
    const slides = document.querySelectorAll('.banner-slide');
    const dots = document.querySelectorAll('.banner-dot');
    const prevButton = document.querySelector('.banner-nav-left');
    const nextButton = document.querySelector('.banner-nav-right');
    let currentSlide = 0;
    let autoSlideInterval;

    // Hàm hiển thị slide
    function showSlide(index) {
        // Xóa trạng thái active của tất cả slides và dots
        slides.forEach((slide) => slide.classList.remove('active'));
        dots.forEach((dot) => dot.classList.remove('active'));

        // Thêm trạng thái active cho slide và dot hiện tại
        slides[index].classList.add('active');
        dots[index].classList.add('active');
    }

    // Hàm chuyển đến slide tiếp theo
    function nextSlide() {
        currentSlide = (currentSlide + 1) % slides.length; // Quay vòng về slide đầu nếu ở slide cuối
        showSlide(currentSlide);
    }

    // Hàm chuyển đến slide trước đó
    function prevSlide() {
        currentSlide = (currentSlide - 1 + slides.length) % slides.length; // Quay vòng về slide cuối nếu ở slide đầu
        showSlide(currentSlide);
    }

    // Xử lý nút Previous
    prevButton.addEventListener('click', () => {
        clearInterval(autoSlideInterval); // Dừng tự động chuyển khi người dùng tương tác
        prevSlide();
        startAutoSlide(); // Bắt đầu lại tự động chuyển
    });

    // Xử lý nút Next
    nextButton.addEventListener('click', () => {
        clearInterval(autoSlideInterval); // Dừng tự động chuyển khi người dùng tương tác
        nextSlide();
        startAutoSlide(); // Bắt đầu lại tự động chuyển
    });

    // Xử lý khi nhấn vào dots
    dots.forEach((dot, index) => {
        dot.addEventListener('click', () => {
            clearInterval(autoSlideInterval); // Dừng tự động chuyển khi người dùng tương tác
            currentSlide = index;
            showSlide(currentSlide);
            startAutoSlide(); // Bắt đầu lại tự động chuyển
        });
    });

    // Hàm bắt đầu tự động chuyển slide
    function startAutoSlide() {
        autoSlideInterval = setInterval(nextSlide, 3000); // Chuyển slide mỗi 3 giây
    }

    // Khởi tạo slide đầu tiên và bắt đầu tự động chuyển
    showSlide(currentSlide);
    startAutoSlide();
});
