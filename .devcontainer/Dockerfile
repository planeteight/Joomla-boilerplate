FROM php:8.4-cli-bookworm

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN apt-get update \
   && export DEBIAN_FRONTEND=noninteractive \
   && apt-get install -y --no-install-recommends \
   build-essential \
   ca-certificates \
   curl \
   fd-find \
   git \
   jq \
   libcurl4-openssl-dev \
   libfreetype6-dev \
   libicu-dev \
   libjpeg62-turbo-dev \
   libonig-dev \
   libpng-dev \
   libzip-dev \
   mariadb-server \
   ripgrep \
   shellcheck \
   shfmt \
   tree \
   unzip \
   && ln -sf "$(command -v fdfind)" /usr/local/bin/fd \
   && docker-php-ext-configure gd --with-freetype --with-jpeg \
   && docker-php-ext-install -j"$(nproc)" curl gd intl mbstring mysqli pdo_mysql zip \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/*
