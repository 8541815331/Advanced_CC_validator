# Use the official PHP Apache image
FROM php:8.1-apache

# Enable mod_rewrite (if needed)
RUN a2enmod rewrite

# Copy website files to the Apache document root
COPY . /var/www/html/

# Set proper permissions (optional)
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
