# Suggested code may be subject to a license. Learn more: ~LicenseLog:1624986171.
# dockerfile
FROM node:16-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:16-alpine AS runner

WORKDIR /app

COPY --from=build /app/dist ./dist

EXPOSE 8080

CMD ["node", "dist/main.js"]
