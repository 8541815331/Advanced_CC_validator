# Use the official PHP Apache image
FROM php:8.1-apache

# Enable mod_rewrite (if needed)
RUN a2enmod rewrite

# Ensure Apache serves index.php first
RUN echo "<Directory /var/www/html/>\\n\
    DirectoryIndex index.php index.html\\n\
    AllowOverride All\\n\
    Require all granted\\n\
</Directory>" > /etc/apache2/sites-available/000-default.conf

# Copy website files to the Apache document root
COPY index.php /var/www/html/index.php

# Set proper permissions (optional)
RUN chown -R www-data:www-data /var/www/html

# Restart Apache
RUN service apache2 restart

# Expose port 80
EXPOSE 80

CMD ["apache2-foreground"]
