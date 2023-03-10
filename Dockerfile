FROM node:18-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD [ "npm", "run", "build" ]

FROM nginx:latest
# Need to expose port for AWS Beanstalk to work properly
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html