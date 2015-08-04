Simple Ubuntu 14.04 virtual environment with Apache configured to work with Django through WSGI.

Purposefully made as barebones as possible, all this does is prepare the virtual environment, with all the requisite packages installed.

# Basic project setup

## Scaffold a Django application

- change directory into ```/vagrant/backend```.

- run ```django-admin.py startproject PROJECT_NAME .``` (the dot denotes to use the current directory as the root of the project).

- edit ```PROJECT_NAME/settings.py``` and set a ```STATIC_ROOT``` variable to dictate where static files are to be dumped.

- Create initial database migrations: ```./manage.py makemigrations```

- Apply migrations to the database: ```./manage.py migrate```

- Create a superuser: ```./manage.py createsuperuser```

- Management command to collect static files: ```./manage.py collectstatic```

## Configure Apache to use project WSGI configuration and to serve static files.

- change directory into ```/etc/apache2/sites-available/``` and edit ```000-default.conf```.

### Configure WSGI

- ```
<Directory /vagrant/backend/PROJECT_NAME>
    <Files wsgi.py>
        Require all granted
    </Files>
</Directory>
``` This will give permissions for wsgi.py

- ```WSGIScriptAlias / /vagrant/backend/PROJECT_NAME/wsgi.py``` This will alias root to WSGI handler

- ```WSGIDaemonProcess PROJECT_NAME python-path=/vagrant/backend``` Run WSGI as daemon process

- ```WSGIProcessGroup PROJECT_NAME``` process group thing

### Configure static files

- ```
<Directory /vagrant/backend/static>
    Require all granted
</Directory>
``` Give permissions to static

- ```Alias /static /vagrant/backend/static``` Alias static root to Django static folder

- ```sudo service apache2 restart``` restart Apache