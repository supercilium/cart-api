FROM node:16-alpine
WORKDIR app
COPY ./package*.json ./
RUN npm install && npm cache clean --force
COPY * ./
RUN npm run build
USER node
EXPOSE 4000
ENTRYPOINT ["node", "dist/main.js"]

# TODO fails on build stage with sh: 1: rimraf: not found
# FROM node:carbon AS base
# WORKDIR app

# FROM base AS deps
# COPY ./package*.json ./
# RUN npm install

# FROM deps AS build
# WORKDIR app
# COPY * ./
# RUN npm run build

# FROM node:16 AS release
# WORKDIR app
# COPY --from=deps app/package*.json ./
# RUN npm i 
# COPY --from=build app ./
# USER node
# EXPOSE 4000
# ENTRYPOINT ["node", "dist/main.js"]