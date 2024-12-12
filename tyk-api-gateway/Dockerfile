# api-gateway/Dockerfile

FROM tykio/tyk-gateway:v4.0.0

COPY tyk-config.json /opt/tyk-gateway/tyk.conf

EXPOSE 8080

CMD ["tyk", "--conf=/opt/tyk-gateway/tyk.conf"]

