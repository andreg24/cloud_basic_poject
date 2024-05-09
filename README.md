# Cloud Basic Assignment: Cloud-Based File Storage System

## Deployment

### Two Nexcloud instances
To run the two instances solution docker containers: 
- 2 Nextcloud; 
- a MySQL database; 
- an NGINX reverse proxy;
- a Redis caching system.

cd to the folder `code` containing the `compose.yml` file and run 
```
docker-compose up -d
```
The two nextcloud instances share the same backend database. NGINX manages the access to them thorugh a balancing mechanism (reverse proxy?)

The web interface can be accessed through `http://localhost:80`


## Testing with Locust

To test the systems simply run the `script.sh` file from the root folder

```
chmod +x script.sh 
./script.sh
```

As a security measure by default nextcloud will only authorize requests made from localhost. 

```bash

docker exec --user www-data nextcloud1 /var/www/html/occ config:system:set trusted_domains 2 --value=nextcloud1

docker exec --user www-data nextcloud1 php /var/www/html/occ config:system:set trusted_domains 3 --value=two_istances_nginx_1


docker exec --user www-data nextcloud2 /var/www/html/occ config:system:set trusted_domains 1 --value=nextcloud2

docker exec --user www-data nextcloud2 php /var/www/html/occ config:system:set trusted_domains 3 --value=two_istances_nginx_1
```

To perform the locust tests we can now use the locust web interface from `http://localhost:8089/`.

The tests are defined in the `testing_locust.py` file. 
With these tasks the script will create new files of different sizes (1kb, 1mb and 1gb), read a README.md, upload the created files and delete them afterwards. 
