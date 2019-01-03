ARG BUILDER_BASE=gradle:5.0.0-jdk11-slim
ARG DOCKER_BASE=openjdk:12-ea-25-jdk-alpine3.8
FROM ${BUILDER_BASE} as builder


COPY . /usr/src/app/
WORKDIR /usr/src/app

ARG APP_NAME="app"
ARG APP_VERSION="0.1.0"
# NOTE: cannot build with user `gradle`, cf.:  https://github.com/keeganwitt/docker-gradle/issues/57
USER root
RUN gradle build

#------
FROM ${DOCKER_BASE}

ARG APP_NAME="app"
ARG VCS_REF="unknown"
ARG BUILD_DATE="unknown"
ARG APP_VERSION="0.1.0"
ARG VENDOR="My Company"
ARG OWNER_REPO="owner/repository"
ARG DESCRIPTION="My Description"

COPY --from=builder /usr/src/app/build/libs/${APP_NAME}-${APP_VERSION}.jar /usr/src/app/
WORKDIR /usr/src/app

LABEL author="My Company <first.last@company.com>"\
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.name="${OWNER_REPO}" \
  org.label-schema.description="${DESCRIPTION}" \
  org.label-schema.usage="https://github.com/${OWNER_REPO}/blob/master/README.md" \
  org.label-schema.url="https://hub.docker.com/r/${OWNER_REPO}" \
  org.label-schema.vcs-url="https://github.com/${OWNER_REPO}" \
  org.label-schema.vcs-ref="${VCS_REF}" \
  org.label-schema.vendor="${VENDOR}" \
  org.label-schema.version="${APP_VERSION}" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.docker.cmd="docker run ${OWNER_REPO}:${APP_VERSION}"

EXPOSE 8080

CMD ["java", "-jar", "${APP_NAME}-${APP_VERSION}.jar"]
