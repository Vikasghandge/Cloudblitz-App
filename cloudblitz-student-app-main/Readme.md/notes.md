# CloudBlitz Application Three-Tire Project.
### info about cloudblitz project.
### Technology used in this project 

Database: RDS , Mariadb(AWS-RDS)
Backend: SpringBoot (java 17 + maven)
frontend: React.js



file structure 
```
.
├── Backend
│   ├── Dockerfile
│   ├── README.md
│   ├── mvnw
│   ├── mvnw.cmd
│   ├── pom.xml
│   └── src
│       ├── main
│       │   ├── java
│       │   │   └── com
│       │   │       └── student
│       │   │           └── registration
│       │   │               └── student_registration_backend
│       │   │                   ├── StudentRegistrationBackendApplication.java
│       │   │                   ├── config
│       │   │                   │   └── WebConfig.java
│       │   │                   ├── controller
│       │   │                   │   └── UserController.java
│       │   │                   ├── model
│       │   │                   │   └── User.java
│       │   │                   └── repository
│       │   │                       └── UserRepository.java
│       │   └── resources
│       │       └── application.properties
│       └── test
│           └── java
│               └── com
│                   └── student
│                       └── registration
│                           └── student_registration_backend
│                               └── StudentRegistrationBackendApplicationTests.java
├── Database
│   ├── Dockerfile
│   ├── README.md
│   └── init.sql
├── Frontend
│   ├── Dockerfile
│   ├── README.md
│   ├── eslint.config.js
│   ├── index.html
│   ├── package-lock.json
│   ├── package.json
│   ├── public
│   │   └── vite.svg
│   ├── src
│   │   ├── App.jsx
│   │   ├── api
│   │   │   └── userService.js
│   │   ├── assets
│   │   │   ├── Bgmain1.jpg
│   │   │   └── bgimg.png
│   │   ├── components
│   │   │   ├── Modal.css
│   │   │   ├── Modal.jsx
│   │   │   ├── RegistrationForm.css
│   │   │   └── RegistrationForm.jsx
│   │   ├── hooks
│   │   │   └── useRegistrationForm.js
│   │   ├── main.jsx
│   │   └── reportWebVitals.js
│   └── vite.config.js
├── Jenkinsfile
├── README.md
└── img
    ├── Screenshot 2025-04-28 at 12.34.44#U202fPM.png
    └── backend.png


```

### prequisites
one ubuntu server name: ClouBlitz-App
instance_type: t2.medium or t2 large
storage: 30GB
we need rds database of mariadb.
create rds db use mariadb
db-name: database-1  # choose whatever you want
admin: admin   # add user name 
password: admin123  # give passowrd
then finally create db once database got created copy database endpoint
copy like below give ypur rds 
```
database-1.cvu4cuyqyi5s.ap-south-1.rds.amazonaws.com
```


now ssh into your server.
```
ssh -i <key-name> ubuntu@<public-ip>
```
update system.
```
sudo apt update -y
```
first we need to install docker in our system.
vi docker.sh
```
#!/bin/bash

# Update package manager repositories
sudo apt-get update

# Install necessary dependencies
sudo apt-get install -y ca-certificates curl

# Create directory for Docker GPG key
sudo install -m 0755 -d /etc/apt/keyrings

# Download Docker's GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Ensure proper permissions for the key
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository to Apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package manager repositories
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

check docker verion
```
docker --version
```
pull demo image
```
docker pull hello-world
```

add root or user into docker group 
```
usermod -aG docker $USER
```

change permissions:
```
chmod 666 /var/run/docker.sock
```
onec it done we need to clone our repo 
```
git clone https://github.com/Vikasghandge/Cloudblitz-App.git
```
first we need to build our database
```
cd database
```
dockerfile
```
FROM mariadb:latest
# Set environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD=admin123   # user db username
ENV MYSQL_DATABASE=student_db      # database name 
ENV MYSQL_USER=admin               # mysql user name 
ENV MYSQL_PASSWORD=admin123        # password

# Copy the initialization script (optional)
COPY init.sql /docker-entrypoint-initdb.d/

# Expose MariaDB port
EXPOSE 3306

```

docker docker image by using docker file.
```
docker build -t database .
```

to check created images.
```
docker images
```

then launch contaier from docker docker image
```
docker run -d --name database -p 3306:3306 database
```
```
docker ps
```
check databases connection.
first we need to instal maridb into your loacal machine
```
sudo apt update
sudo apt install mysql-client -y
mysql -h <rds-endpoint> -u <db-username> -p<password>

```
```
show databases;
```
```
use databasename;
```
create database
```
CREATE DATABASE student_db;
USE student_db;
```
add tabel
```
CREATE TABLE `students` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `student_class` varchar(255) DEFAULT NULL,
  `percentage` double DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
```
```
exit;
```




```
cd Backend
```
backend docker file.
```
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENV DB_URL=jdbc:mariadb://database-1.cvu4cuyqyi5s.ap-south-1.rds.amazonaws.com:3306/student_db \  # your rds url
    DB_USERNAME=admin

CMD ["java", "-jar", "app.jar"]



# after apply docker build command 

# docker build -t student-backend .
# docker run -e DB_PASSWORD=YourSecret -p 8080:8080 student-backend

```

```
vim src/main/resorces/application.properties
```

add passwords  and file give demo below 
```
server.port=8080   # application port
spring.datasource.url=jdbc:mariadb://database-1.cvu4cuyqyi5s.ap-south-1.rds.amazonaws.com:3306/student_db #endpont 
spring.datasource.username=admin   # add your username 
spring.datasource.password=admin123  # add your db passwd password 
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MariaDBDialect

```
build backend docker file 
```
docker build -t backend .
```

```
docker images
```

now launch container 
```
docker run ---name backend -p 8080:8080 backend
```
```
docker ps
```

now we need to build frontend 
```
vi /src/api/userService.js
```
add your backend ip address in your userService.js file
```
const BASE_URL = "http://13.235.42.149:8080/api";   # replace only ip address of your backend

```
now build docker image from docker file
```
docker build -t frontend .
```
```
docker run -d --name frontend -p 80:80 frontend
```
```
docker ps 
```

go to aws console copy public ip of your server and add
```
http://<ip-address>:80
```





 
















