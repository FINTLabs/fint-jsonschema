FROM fint/jsonschema-generator:1.2.0 AS builder
ARG TAG_NAME
WORKDIR /
RUN ["/usr/bin/fint-jsonschema-generator", "generate"]

FROM fintlabsacr.azurecr.io/nginx:1.17.6-5
COPY --from=builder /json/schema/ /html/
