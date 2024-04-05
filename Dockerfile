FROM centos:latest

# Install necessary packages
RUN yum install -y httpd unzip && \
    yum clean all

# Download and unzip the template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page258/loxury.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip loxury.zip && \
    cp -rvf loxury/* . && \
    rm -rf loxury loxury.zip

# Start Apache HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
