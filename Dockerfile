FROM php:7.4

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    openssh-client \
    rsync \
    apt-transport-https \
    build-essential \
    imagemagick \
    libmcrypt-dev \
    libmagickwand-dev \
    libpng-dev \ 
    libzip-dev \
    openssl \
    zip \ 
    unzip \
    git \
    gnupg \
    zlib1g-dev \
    libgtk2.0-0 \
    libgtk-3-0 \
    libgbm-dev \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 \
    xauth \
    xvfb

# install php dependencies
RUN pecl install imagick mcrypt-1.0.2 \
    && docker-php-ext-install -j$(nproc) exif iconv soap zip \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd pdo_mysql \
    && docker-php-ext-enable mcrypt exif

# Install composer and put binary into $PATH
RUN curl -sS https://getcomposer.org/installer | php -- --version=1.10.17 && \
    mv composer.phar /usr/local/bin/ && \
    ln -s /usr/local/bin/composer.phar /usr/local/bin/composer

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs


# RUN apt update && \
#   apt install -y openssh-client rsync apt-transport-https build-essential gnupg2 git imagemagick libpng-dev libxml2-dev node-gyp zip unzip zlib1g-dev
  
# Install additionnal PHP modules
# RUN docker-php-ext-install -j$(nproc)  mysqli pdo_mysql soap zip

# Install composer and put binary into $PATH
# RUN curl -sS https://getcomposer.org/installer | php && \
    # mv composer.phar /usr/local/bin/ && \
    # ln -s /usr/local/bin/composer.phar /usr/local/bin/composer
