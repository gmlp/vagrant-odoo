#!/bin/bash
# Install main dependencies
sudo apt-get update
sudo apt-get install -y \
     git \
     python3 \
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
    python3-dev \
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
sudo -u postgres createuser --createdb vagrant 
sudo -u vagrant createdb 

# Activate virtualenv and install odoo python dependencies
virtualenv -p python3 ~vagrant/odoo-13.0
source ~vagrant/odoo-13.0/bin/activate
wget https://raw.githubusercontent.com/odoo/odoo/13.0/requirements.txt
pip3 install -r requirements.txt
sudo chown -R vagrant:vagrant ~vagrant

#Create your first odoo instance
cd /vagrant/odoo
sudo -u vagrant createdb odoo-dev 