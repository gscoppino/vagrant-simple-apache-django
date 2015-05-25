Simple CentOS 7 virtual environment with Apache configured to work with Django through WSGI.

Purposefully made as barebones as possible, all this does is prepare the virtual environment, with all the requisite packages installed.

Basic project setup workflow:

Scaffold a Django app:
- cd into the ```/vagrant/web_stack_server_side``` directory.

- run ```django-admin.py startproject PROJECT_NAME .``` (the dot denotes to use this directory as the root).

- edit ```PROJECT_NAME/settings.py``` and set a ```STATIC_ROOT``` location for static files to be dumped.
- ```./manage.py makemigrations```
- ```./manage.py migrate```
- ```./manage.py createsuperuser```
- ```./manage.py collectstatic```
Configure Apache to serve static files and communicate via project WSGI configuration
(Ubuntu)

- cd into ```/etc/httpd/conf.d/``` and create a file to edit called ```virtualhost.conf```

- Scaffold the file as such:
```
<VirtualHost *:80>
    ServerName localhost/
    ServerAdmin webmaster@localhost
</VirtualHost>
```

Configure WSGI (Append in VirtualHost section)

- ```
<Directory /vagrant/web_stack/server_side/PROJECT_NAME>
    <Files wsgi.py>
        Require all granted
    </Files>
</Directory>
``` This will give permissions for wsgi.py

- ```WSGIScriptAlias / /vagrant/web_stack/server_side/PROJECT_NAME/wsgi.py``` This will alias root to WSGI handler

- ```WSGIDaemonProcess PROJECT_NAME python-path=/vagrant/web_stack/server_side``` Run WSGI as daemon process

- ```WSGIProcessGroup PROJECT_NAME``` process group thing

Configure static files (Append in VirtualHost section)

- ```
<Directory /vagrant/web_stack/server_side/static>
    Require all granted
</Directory>
``` Give permissions to static

- ```Alias /static /vagrant/web_stack/server_side/static``` Alias static root to Django static folder

- ```sudo service httpd restart``` restart httpd 
