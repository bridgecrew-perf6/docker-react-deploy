

# 빌드파일 생성부분

FROM node:alpine as builder

WORKDIR '/usr/src/app'

COPY package.json .

RUN npm install

COPY ./ ./

RUN npm run build

# nginx 설정

FROM nginx
 
COPY --from=builder /usr/src/app/build /usr/share/nginx/html



