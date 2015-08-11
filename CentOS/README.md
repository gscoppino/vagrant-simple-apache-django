Simple CentOS 7 virtual environment for Apache configured to work with Django through WSGI.

Purposefully made as barebones as possible.

# Basic project setup

## Scaffold a Django application

- A new project called ```project``` will automatically be created for you in ```/vagrant/backend``` if
the provisioner doesn't find a ```manage.py``` file in that location.

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
