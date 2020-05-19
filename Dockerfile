FROM fint/jsonschema-generator:1.0.0-rc-1 AS builder
WORKDIR /
RUN ["/usr/bin/fint-jsonschema-generator", "generate"]

FROM fintlabs.azurecr.io/nginx:1.15.10-1
COPY --from=builder /json/schema/ /etc/nginx/html/
