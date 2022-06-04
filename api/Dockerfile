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
RUN npm install --production
EXPOSE 4002
CMD npm start
