FROM node as build
WORKDIR /app
COPY ./package.json /app/
RUN npm install
COPY . /app
#COPY ./certs /certs
RUN npm run build

FROM nginx
COPY --from=build /app/dist /usr/share/nginx/html
#COPY --from=build /certs /usr/share/certs
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]