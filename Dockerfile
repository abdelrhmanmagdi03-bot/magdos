FROM node:20-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm install
COPY . .
EXPOSE 4000
CMD ["npm", "run", "start-dev"]

FROM base AS test
RUN npm install
COPY . .
CMD ["npm", "test"]

FROM base AS production
ENV NODE_ENV=production
RUN npm ci --omit=dev
COPY . .
EXPOSE 4000
USER node
CMD ["npm", "run", "start"]








