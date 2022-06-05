FROM cirrusci/flutter:3.0.1 AS build

RUN flutter doctor
RUN flutter config --enable-web

USER root
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web

FROM nginx:1.21.1-alpine
COPY --from=build /app/build/web /usr/share/nginx/html
