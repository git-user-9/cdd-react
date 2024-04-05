FROM alpine:latest

# Install necessary packages
RUN apk --no-cache add apache2-utils apache2 zip unzip

# Download and extract the website template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page279/jack-and-rose.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip jack-and-rose.zip && \
    cp -rvf free-wedding-website-template/* . && \
    rm -rf free-wedding-website-template jack-and-rose.zip

# Set the working directory and expose port 80
WORKDIR /var/www/html
EXPOSE 80

# Start Apache HTTP server
CMD ["httpd", "-D", "FOREGROUND"]
