FROM fint/jsonschema-generator:1.0.0 AS builder
ARG TAG_NAME
WORKDIR /
RUN ["/usr/bin/fint-jsonschema-generator", "generate"]

FROM fintlabsacr.azurecr.io/nginx:1.15.10-1
COPY --from=builder /json/schema/ /etc/nginx/html/
