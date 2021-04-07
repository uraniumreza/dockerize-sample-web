FROM node:alpine as build

WORKDIR /home/app

COPY ./package.json ./
RUN npm install

COPY ./ ./

RUN npm run build


FROM nginx
COPY --from=build /home/app/build /usr/share/nginx/html
