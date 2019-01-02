ARG BUILDER_BASE=gradle:5.0.0-jdk11-slim
ARG DOCKER_BASE=openjdk:12-ea-25-jdk-alpine3.8
FROM ${BUILDER_BASE} as builder

# NOTE: unusually using ./ as build context so we can use .git info in gradle
COPY .git/ app/ /usr/src/app/
WORKDIR /usr/src/app
# NOTE: cannot build with user `gradle`, cf.:  https://github.com/keeganwitt/docker-gradle/issues/57
USER root
RUN gradle --no-daemon build

#------
FROM ${DOCKER_BASE}

COPY --from=builder /usr/src/app/build/libs/gs-spring-boot-0.1.0.jar /usr/src/app/
WORKDIR /usr/src/app

# TODO
ARG VCS_REF="unknown"
ARG BUILD_DATE="unknown"
ARG DOCKER_TAG="latest"
ARG VENDOR="My Company"
ARG OWNER_REPO="owner/repository"
ARG DESCRIPTION="My Description"

LABEL author="My Company <first.last@company.com>"\
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.name="${OWNER_REPO}" \
  org.label-schema.description="${DESCRIPTION}" \
  org.label-schema.usage="https://github.com/${OWNER_REPO}/blob/master/README.md" \
  org.label-schema.url="https://hub.docker.com/r/${OWNER_REPO}" \
  org.label-schema.vcs-url="https://github.com/${OWNER_REPO}" \
  org.label-schema.vcs-ref="${VCS_REF}" \
  org.label-schema.vendor="${VENDOR}" \
  org.label-schema.version="${DOCKER_TAG}" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.docker.cmd="docker run ${OWNER_REPO}:${DOCKER_TAG}"

EXPOSE 8080

CMD ["java", "-jar", "gs-spring-boot-0.1.0.jar"]
