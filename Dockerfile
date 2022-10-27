FROM squidfunk/mkdocs-material as builder
WORKDIR /tmp
ADD . .
RUN mkdocs build

FROM nginx:alpine
COPY --from=builder /tmp/site /usr/share/nginx/html/
EXPOSE 80