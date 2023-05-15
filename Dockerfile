# Указываем базовый образ
FROM nginx

# Удаляем стандартный конфиг
RUN rm /etc/nginx/nginx.conf

# Копируем наш конфиг
COPY nginx.conf /etc/nginx/nginx.conf

# Копируем наш файл приложения
COPY sec.html /usr/share/nginx/html/
