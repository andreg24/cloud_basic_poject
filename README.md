# Cloud Basic Assignment: Cloud-Based File Storage System

## Deployment

### Two Nexcloud instances
To run the two instances solution docker containers: 
- 2 Nextcloud; 
- a MySQL database; 
- an NGINX reverse proxy;
- a Redis caching system;
- a Locust container for testing.

In addition, a network linking the containers has been employed.

cd to the folder `code` containing the `docker-compose.yml` file and run 
```
docker-compose up -d
```
The two nextcloud instances share the same backend database. NGINX manages the access to them by actingas a reverse proxy.

The web interface can be accessed through `http://localhost:80`


## Testing with Locust

To test the load capabilities and performance of the system we used the script **CreateTestUsers.ps1** to generate 30 users and then we performed the test using Locust. We performed 4 tests, differing for the size of the files uploaded. The accessed the Locust interface at `http://localhost:8089/`.

To perform the locust tests we can now use the locust web interface from `http://localhost:8089/`.

