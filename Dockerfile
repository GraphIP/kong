ARG KONG_BASE=kong:2.2.1-alpine



FROM ${KONG_BASE} AS build

ARG PLUGINS
ENV INJECTED_PLUGINS=${PLUGINS}

ARG TEMPLATE=empty_file
ENV TEMPLATE=${TEMPLATE}

ARG ROCKS_DIR=empty_file
ENV ROCKS_DIR=${ROCKS_DIR}

ARG KONG_LICENSE_DATA
ENV KONG_LICENSE_DATA=${KONG_LICENSE_DATA}

COPY $TEMPLATE /plugins/custom_nginx.conf
COPY $ROCKS_DIR /rocks-server
COPY packer.lua /packer.lua

USER root

RUN /usr/local/openresty/luajit/bin/luajit /packer.lua -- "$INJECTED_PLUGINS"


FROM ${KONG_BASE}

USER root

# Install Google Cloud SQL Proxy
RUN apk add --no-cache \
		ca-certificates \
        wget \
		&& wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -O /usr/bin/cloud_sql_proxy \
		&& chmod +x /usr/bin/cloud_sql_proxy

# Rename default response headers (rename "Kong" to "Gateway")
RUN sed -i s/"X-Kong/"X-Gateway/g /usr/local/share/lua/5.1/kong/constants.lua

COPY --from=build /plugins /plugins

USER root

RUN /plugins/install_plugins.sh

USER kong