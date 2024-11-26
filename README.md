# Dockerized Laravel Project

This project includes a Laravel application configured to run in a Docker environment. The Docker setup includes services for Nginx, PHP-FPM, MySQL, Redis, Node.js, and queue workers, providing a complete environment for developing and deploying Laravel applications.

## Requirements

- Docker
- Docker Compose

## Installation

1. Clone the repository:

   ```
   git clone https://github.com/josecortesdev/laravel-dockerized.git
   cd laravel-dockerized
   ```
   

2. Inside src directory: copy the ```.env.example``` file to ```.env``` and set your environment variables:
```
cp .env.example .env
```  

3. In the root of the project, build and lift the containers:
```
docker-compose up --build
```  

4. Install Composer dependencies:
```
docker-compose run --rm composer install
``` 

5. Generate the application key:
```
docker-compose run --rm artisan key:generate
``` 

6. Run the migrations
```
docker-compose run --rm artisan migrate
```  

## Development use
To set up the development environment, use the following command:
```
docker-compose up
```

To set up the production environment, use the following command:
```
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build
```


## Project Structure

| Files                | Function                                      |
|-------------------------|----------------------------------------------|
| `nginx.dockerfile`      | Nginx configuration for development       |
| `nginx.prod.dockerfile` | Nginx configuration for production       |
| `php.dockerfile`        | PHP-FPM configuration for development     |
| `php.prod.dockerfile`   | PHP-FPM configuration for production     |
| `docker-compose.yml`    | Docker Compose configuration for development |
| `docker-compose.prod.yml` | Docker Compose configuration for production |



## Useful commands
To run Artisan commands, use the following command:
```
docker-compose exec artisan php artisan <comando>
```    

To install Composer dependencies, use the following command:
```
docker-compose run --rm composer install
```    

To install NPM dependencies and build, use the following commands:
```
docker-compose run --rm npm install
```    
```
docker-compose run --rm npm run dev
```   

## Suggestions
Suggestions are welcome. Please write to me at josecortesdev@gmail.com