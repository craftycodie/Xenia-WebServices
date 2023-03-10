FROM node:19.7-alpine AS builder

RUN mkdir /.npm-global
ARG NPM_CONFIG_PREFIX=/.npm-global
RUN npm install -g @nestjs/cli

FROM node:19.7-alpine AS dev

COPY --from=builder /.npm-global /.npm-global

ENV PATH="/.npm-global/bin:$PATH"

WORKDIR /app