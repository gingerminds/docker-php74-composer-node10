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


RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
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

