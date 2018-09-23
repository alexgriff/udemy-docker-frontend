FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# at this point /app/build has all prod assets
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
