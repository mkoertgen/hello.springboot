ARG BUILDER_BASE=gradle:5.0.0-jdk11-slim
ARG DOCKER_BASE=openjdk:12-ea-25-jdk-alpine3.8
FROM ${BUILDER_BASE} as builder


COPY . /usr/src/app/
WORKDIR /usr/src/app

ARG ARTIFACT_NAME="app"
ARG ARTIFACT_VERSION="0.1.0"
# NOTE: cannot build with user `gradle`, cf.:  https://github.com/keeganwitt/docker-gradle/issues/57
USER root
RUN gradle build

#------
FROM ${DOCKER_BASE}

ARG ARTIFACT_NAME="config-server"
ARG ARTIFACT_VERSION="0.1.0"
ARG VCS_REF="unknown"
ARG BUILD_DATE="unknown"
ARG VENDOR="My Company"
ARG OWNER_REPO="owner/repository"
ARG DESCRIPTION="My Description"

COPY --from=builder /usr/src/app/build/libs/${ARTIFACT_NAME}-${ARTIFACT_VERSION}.jar /usr/src/app/app.jar
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
  org.label-schema.version="${ARTIFACT_VERSION}" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.docker.cmd="docker run ${OWNER_REPO}:${ARTIFACT_VERSION}"

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
