# استفاده از ایمیج رسمی Flutter
FROM ghcr.io/cirruslabs/flutter:stable AS build

# تنظیم مسیر کاری در کانتینر
WORKDIR /app

# کپی کردن فایل‌های pubspec برای کش شدن وابستگی‌ها
COPY pubspec.* ./

# دریافت وابستگی‌های پروژه با استفاده از flutter pub
RUN flutter pub get

# کپی کردن کل سورس کد به داخل کانتینر
COPY . .


# مرحله اجرای نهایی
FROM ghcr.io/cirruslabs/flutter:stable AS runtime

# تنظیم مسیر کاری
WORKDIR /app

# کپی فایل‌های ساخته‌شده از مرحله قبل
COPY --from=build /app /app

# اجرای ربات داخل دایرکتوری lib
CMD ["dart", "lib/main.dart"]
