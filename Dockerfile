FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN yarn install
COPY . .
RUN yarn run build

# /app/build    <-- all the stuff we just built

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
