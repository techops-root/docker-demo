#Pull the minimal Ubuntu image
FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf

WORKDIR /default

# Install Nginx
RUN apt-get -y update && apt-get -y install nginx

# Copy the Nginx config
COPY nginx-config/default.conf /etc/nginx/conf.d/default.conf

# Expose the port for access
EXPOSE 80/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
