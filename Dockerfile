# Use the official ClickHouse image as the base image
FROM clickhouse/clickhouse-server:23.1-alpine

COPY ./docker-entrypoint-initdb.d/docker-entrypoint-initdb.sql /docker-entrypoint-initdb.d/docker-entrypoint-initdb.sql
COPY ./scripts/sed.sh sed.sh

ARG KAFKA_BROKER_LIST
ARG KAFKA_TOPIC_LIST
ARG KAFKA_GROUP_NAME

RUN bash sed.sh KAFKA_BROKER_LIST ${KAFKA_BROKER_LIST}
RUN bash sed.sh KAFKA_TOPIC_LIST ${KAFKA_TOPIC_LIST}
RUN bash sed.sh KAFKA_GROUP_NAME ${KAFKA_GROUP_NAME}