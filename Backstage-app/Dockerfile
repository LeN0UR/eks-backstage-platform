# Multi-stage Backstage build (bundled frontend served by backend)
# Ref: https://backstage.io/docs/deployment/docker/#multi-stage-build

FROM node:20-bookworm-slim AS build

WORKDIR /app

# Needed for native deps that some Backstage plugins use
RUN apt-get update && apt-get install -y --no-install-recommends \
  python3 g++ build-essential \
  && rm -rf /var/lib/apt/lists/*

# Copy minimal files first for better layer caching
COPY package.json yarn.lock .yarnrc.yml ./
COPY .yarn ./.yarn
COPY packages ./packages
COPY plugins ./plugins

# Install + build
RUN corepack enable
RUN yarn install --immutable
RUN yarn build:backend

FROM node:20-bookworm-slim AS runtime
WORKDIR /app
ENV NODE_ENV=production

# Copy the built backend bundle + required runtime files
COPY --from=build /app/packages/backend/dist ./packages/backend/dist
COPY --from=build /app/packages/backend/package.json ./packages/backend/package.json
COPY --from=build /app/app-config.yaml ./app-config.yaml

# If you use app-config.production.yaml, copy it too
# COPY --from=build /app/app-config.production.yaml ./app-config.production.yaml

EXPOSE 7007

CMD ["node", "packages/backend/dist/index.js", "--config", "app-config.yaml"]



