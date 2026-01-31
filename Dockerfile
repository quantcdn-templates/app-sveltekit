# Build stage - runs natively (not emulated) for faster builds
ARG NODE_VERSION=22
ARG BUILDPLATFORM=linux/amd64
FROM --platform=$BUILDPLATFORM node:${NODE_VERSION}-bookworm-slim AS builder

WORKDIR /build

# Copy package files
COPY package*.json ./

# Install all dependencies
RUN npm ci

# Copy source files
COPY . .

# Build the application
RUN npm run build

# Install production dependencies only (in builder stage to avoid QEMU issues)
RUN rm -rf node_modules && npm ci --omit=dev

# Production stage
FROM ghcr.io/quantcdn-templates/app-node:${NODE_VERSION}

WORKDIR /app

# Copy entrypoint scripts
COPY quant/entrypoints/ /quant-entrypoint.d/
RUN find /quant-entrypoint.d -name "*.sh" -exec chmod +x {} \; 2>/dev/null || true

# Copy built application and production dependencies from builder
COPY --from=builder --chown=node:node /build/build ./build
COPY --from=builder --chown=node:node /build/package*.json ./
COPY --from=builder --chown=node:node /build/node_modules ./node_modules

# CRITICAL: App port must be 3001 (proxy runs on 3000)
ENV PORT=3001
ENV HOST=0.0.0.0
ENV NODE_ENV=production

# Expose proxy port
EXPOSE 3000

# Start the SvelteKit server
CMD ["node", "build"]
