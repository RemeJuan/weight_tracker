FROM node:17 AS build
COPY package.json ./
COPY package-lock.json ./
COPY tsconfig.json ./
RUN npm install
COPY ./src ./src
RUN npm run build

FROM node:17-alpine AS release
COPY --from=build /dist ./dist
COPY --from=build /package.json ./package.json
RUN apk add --no-cache --virtual .gyp python3 make g++
RUN npm install --production
RUN apk del .gyp
EXPOSE 4002
CMD npm start
