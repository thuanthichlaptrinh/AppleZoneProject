// Thumbnail carousel
let currentThumbnailIndex = 0;
const thumbnailSlide = document.getElementById('thumbnailSlide');
const thumbnails = document.querySelectorAll('.thumbnail');
const nextBtn = document.getElementById('nextBtn');
const prevBtn = document.getElementById('prevBtn');
const mainImage = document.getElementById('mainImage');
const thumbnailWidth = 90; // Width of thumbnail + gap

const updateSlidePosition = () => {
    const offset = -currentThumbnailIndex * thumbnailWidth;
    thumbnailSlide.style.transform = `translateX(${offset}px)`;
    thumbnails.forEach((t) => t.classList.remove('active'));
    thumbnails[currentThumbnailIndex].classList.add('active');
    mainImage.src = thumbnails[currentThumbnailIndex].src;
};

nextBtn.addEventListener('click', () => {
    currentThumbnailIndex = (currentThumbnailIndex + 1) % thumbnails.length; // Quay vòng
    updateSlidePosition();
});

prevBtn.addEventListener('click', () => {
    currentThumbnailIndex = (currentThumbnailIndex - 1 + thumbnails.length) % thumbnails.length; // Quay vòng
    updateSlidePosition();
});

thumbnails.forEach((thumbnail, index) => {
    thumbnail.addEventListener('click', () => {
        currentThumbnailIndex = index;
        updateSlidePosition();
    });
});

// Storage and Color selection
const storageOptions = document.getElementById('storageOptions').getElementsByTagName('button');
const colorOptions = document.getElementById('colorOptions').getElementsByTagName('button');
const productPrice = document.getElementById('productPrice');
const originalPrice = document.getElementById('originalPrice');

Array.from(storageOptions).forEach((button) => {
    button.addEventListener('click', () => {
        Array.from(storageOptions).forEach((b) => b.classList.remove('active', 'border-blue-500', 'text-blue-500'));
        button.classList.add('active', 'border-blue-500', 'text-blue-500');
        productPrice.textContent = `${parseInt(button.dataset.price).toLocaleString('vi-VN')}₫`;
        originalPrice.textContent = `${parseInt(button.dataset.original).toLocaleString('vi-VN')}₫`;
    });
});

Array.from(colorOptions).forEach((button) => {
    button.addEventListener('click', () => {
        Array.from(colorOptions).forEach((b) => b.classList.remove('border-blue-500'));
        button.classList.add('border-blue-500');
    });
});
