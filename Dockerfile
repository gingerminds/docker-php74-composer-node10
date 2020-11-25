FROM php:7.3

RUN apt-get update \
    && apt-get install -y --no-install-recommends

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs npm

RUN npm install -g gulp bower
RUN echo '{ "allow_root": true  }' > /root/.bowerrc


# RUN apt update && \
#   apt install -y openssh-client rsync apt-transport-https build-essential gnupg2 git imagemagick libpng-dev libxml2-dev node-gyp zip unzip zlib1g-dev
  
# Install additionnal PHP modules
# RUN docker-php-ext-install -j$(nproc)  mysqli pdo_mysql soap zip

# Install composer and put binary into $PATH
# RUN curl -sS https://getcomposer.org/installer | php && \
    # mv composer.phar /usr/local/bin/ && \
    # ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

# Install Node.js & Yarn
# RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    # apt install -y nodejs

# RUN npm install -g gulp bower
# RUN echo '{ "allow_root": true  }' > /root/.bowerrc

