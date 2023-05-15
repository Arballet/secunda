# Указываем базовый образ
FROM nginx

# Удаляем стандартный конфиг
RUN rm /etc/nginx/nginx.conf

# Копируем наш конфиг
COPY nginx.conf /etc/nginx/nginx.conf

# Копируем наш файл приложения
COPY sec.html /usr/share/nginx/html/

# Копируем шрифт в папку со статическими файлами
COPY font.ttf /usr/share/nginx/html/

ENV LANG=en_US.utf8
# Добавляем директиву в конфигурационный файл Nginx
RUN sed -i -e 's@# server_tokens off;@# server_tokens off;\n   add_header Content-Security-Policy "font-src '\''self'\'' data:; style-src '\''self'\''";@g' /etc/nginx/nginx.conf
