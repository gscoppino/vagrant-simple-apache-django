Simple CentOS 7 virtual environment with Apache configured to work with Django through WSGI.

Purposefully made as barebones as possible, all this does is prepare the virtual environment, with all the requisite packages installed.

# Basic project setup

## Scaffold a Django application

- change directory into ```/vagrant/backend```.

- run ```django-admin.py startproject PROJECT_NAME .``` (the dot denotes to use the current directory as the root of the project).

- edit ```PROJECT_NAME/settings.py``` and set the ```STATIC_ROOT``` variable to dictate where static files are to be dumped.

- Create initial database migrations: ```./manage.py makemigrations```

- Apply migrations to the database: ```./manage.py migrate```

- Create a superuser: ```./manage.py createsuperuser```

- Management command to collect static files: ```./manage.py collectstatic```

## Configure VirtualHost

- change directory into ```/etc/httpd/conf.d/``` and create a file called ```virtualhost.conf```

- Scaffold the file as such:
```
<VirtualHost *:80>
    ServerName localhost/
    ServerAdmin webmaster@localhost
</VirtualHost>
```

## Configure WSGI (Append in VirtualHost section)

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

## Configure static files (Append in VirtualHost section)

- ```
<Directory /vagrant/backend/static>
    Require all granted
</Directory>
``` Give permissions to static

- ```Alias /static /vagrant/backend/static``` Alias static root to Django static folder

- ```sudo service httpd restart``` restart httpd
