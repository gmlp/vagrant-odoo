#!/bin/bash

# Install main dependencies
sudo apt-get update
sudo apt-get install -y \
     git \
     python3.7 \
     postgresql \
     vim \
     virtualenv \
     xz-utils \
     wget \
     fontconfig \
     libfreetype6 \
     libx11-6 \
     libxext6 \
     libxrender1 \
     xfonts-75dpi

# Install wkhtmltopdf
wget -O wkhtmltox.tar.xz \
     https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz 
tar xvf wkhtmltox.tar.xz
sudo mv wkhtmltox/lib/* /usr/local/lib/
sudo mv wkhtmltox/bin/* /usr/local/bin/
sudo mv wkhtmltox/share/man/man1 /usr/local/share/man/

# install Build dependencies
sudo apt-get install -y \
    gcc \
    python3.7-dev \
    libxml2-dev \
    libxslt1-dev \
    libevent-dev \
    libsasl2-dev \
    libssl1.0-dev \
    libldap2-dev \
    libpq-dev \
    libpng-dev \
    libjpeg-dev

# Configure Postgres
sudo -u postgres createuser --createdb $(whoami)
createdb $(whoami)

# clone odoo 13 repo
mkdir ~/odoo-dev
cd ~/odoo-dev
git clone -b 13.0 --single-branch --depth=5 https://github.com/odoo/odoo.git 
cd odoo

# Activate virtualenv and install odoo python dependencies
virtualenv -p python3 ~/odoo-13.0
source ~/odoo-13.0/bin/activate
pip3 install -r requirements.txt



