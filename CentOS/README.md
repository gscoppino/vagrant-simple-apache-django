Simple CentOS 7 virtual environment for Apache configured to work with Django through WSGI.

Purposefully made as barebones as possible, all this does is prepare the virtual environment, with all the requisite packages installed.

# Basic project setup

## Scaffold a Django application

- change directory into ```/vagrant/backend```.

### Start a new project

- Run```django-admin.py startproject PROJECT_NAME .``` (the dot denotes to use the current directory as the root of the project).

### Project configuration

- Open ```PROJECT_NAME/settings.py```.

#### Database ####

    - ```DATABASES['default']```: Provide information for your database management system here.

#### Static Files ####

    - ```STATIC_URL```: The directory Django will look in for static files within ```INSTALLED_APPS``` when using ```./manage.py runserver``` or ```./manage.py collectstatic```.

    - ```STATIC_ROOT```: Where Django will dump static files it finds via ```./ manage.py collectstatic```.

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
