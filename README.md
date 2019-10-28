vagrant-odoo
=====
## Clone odoo 13 repository
```bash
git clone -b 13.0 --single-branch --depth=5 git@github.com:odoo/odoo.git
```

## Create developement environment 
```bash
vagrant up
vagrant ssh
source ~/odoo-13.0/bin/activate
cd /vagrant/odoo
python3 odoo-bin \
    -d odoo-dev \
    --addons-path=addons \
    -i base \
     --stop-after-init
exit
```

## Use the development environment 
```bash
vagrant up
vagrant ssh
source ~/odoo-13.0/bin/activate
cd /vagrant/odoo
python3 odoo-bin \
    --db-filter=odoo-dev
```

## shutdown dev env
```bash
vagrant halt
```

## destroy dev env
```bash
vagrant destroy -f
```