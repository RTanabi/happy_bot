# استفاده از ایمیج رسمی Flutter
FROM ghcr.io/cirruslabs/flutter:stable AS build

# تنظیم مسیر کاری در کانتینر
WORKDIR /app

# کپی کردن فایل‌های pubspec برای کش شدن وابستگی‌ها
COPY pubspec.* ./

# دریافت وابستگی‌های پروژه با استفاده از flutter pub
# RUN dart pub get
RUN flutter pub get

RUN ls -la /root/.pub-cache/hosted/pub.dev/teledart-0.6.1/lib/


# کپی کردن کل سورس کد به داخل کانتینر
COPY . .

RUN flutter pub get

# مرحله اجرای نهایی
FROM ghcr.io/cirruslabs/flutter:stable AS runtime

# تنظیم مسیر کاری
WORKDIR /app

# کپی فایل‌های ساخته‌شده از مرحله قبل
COPY --from=build /app /app

RUN flutter pub get

# اجرای ربات داخل دایرکتوری lib
CMD ["dart", "lib/main.dart"]
