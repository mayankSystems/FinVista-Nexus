# FinVista Nexus Bank Application

Microservices - POC

---

## Technologies Used

- **MySQL**
- **Java**
- **Docker**
- **Kubernetes**
- **Kafka**
- **Spring Boot**
- **RabbitMQ**
- **Maven**
- **Docker Compose**
- **REST API**
- **Helm**
- **Spring Cloud**
- **Grafana**
- **Swagger**
- **OpenAPI**
- **Eureka**
- **Spring Cloud Gateway**
- **Resilience4j**
- **OpenTelemetry**
- **OAuth2/OpenID Connect**
- **KeyCloak (IAM)**
- **Spring Security**
- **Spring Cloud Functions**
- **Spring Cloud Stream**

## Project Overview

The FinVista Nexus project is designed to be a scalable and resilient application, utilizing modern technologies to ensure high performance and reliability.

### Database

We use **MySQL** as our primary database to store all persistent data.

### Backend

Our backend services are written in **Java** and built with **Spring Boot**, leveraging **Spring Cloud** for service discovery, configuration, and more. **Eureka** is used for service registration and discovery.

### Messaging and Streaming

For messaging, we use **RabbitMQ**, and for event streaming, we leverage **Kafka**.

### Authentication and Authorization

The project uses **OAuth2** for secure authentication and authorization.

### Deployment and Containerization

All services are containerized using **Docker** and managed with **Kubernetes**. We also use **Docker Compose** for local development and testing.

### API Documentation

APIs are documented using **Swagger** and **OpenAPI** for easy testing and integration.

### Monitoring and Observability

For monitoring, we use **Grafana** along with **OpenTelemetry** for tracing. **Resilience4j** is implemented to ensure fault tolerance in our services.

### API Gateway

**Spring Cloud Gateway** is used as the API Gateway to route requests to various microservices.

### Deployment Tools

We utilize **Helm** for deploying applications on Kubernetes.

---

## Maven Commands

- To generate a jar inside target folder w/o running unit tests

```shell
mvn clean install -Dmaven.test.skip=true 
```

- To run a spring-boot maven project using terminal

```shell
mvn spring-boot:run
```

- To generate a docker image using BuildPacks (Packeto). No need of Dockerfile

```shell
mvn spring-boot:build-image 
```

- To generate a docker image using Google Jib. No need of Dockerfile

```shell
mvn compile jib:dockerBuild 
```

---

## Docker & Docker Compose Commands

### Docker Commands

- To display the system wide information of the Docker installation.

```shell
docker info | more
```

- To build a docker image from `Dockerfile2` which is located in the current directory `.`

```shell
docker build . -f Dockerfile2 -t devmayank8/myApp
```

- To build a docker image from `Dockerfile` which is located in the current directory `.`

```shell
docker build . -t devmayank8/finvistanexus-accounts:1.0.1-SNAPSHOT
```

- To run a container with a particular name using that same docker image in detached mode

```shell
docker run -d --name fvn-accounts -p 8080:8080 devmayank8/finvistanexus-accounts:1.0.1-SNAPSHOT
```

- To run a container with a particular name using that same docker image in detached & debug mode

```shell
docker run -d --name fvn-accounts -p 8080:8080 -p 5005:5005 devmayank8/finvistanexus-accounts:1.0.1-SNAPSHOT
docker run -d --name fvn-accounts -p 8090:8090 -p 5010:5010 devmayank8/finvistanexus-loans:1.0.1-SNAPSHOT
docker run -d --name fvn-accounts -p 9000:9000 -p 5015:5015 devmayank8/finvistanexus-cards:1.0.1-SNAPSHOT
```

- To run RabbitMQ 3.13 container in detached mode using docker image and default credentials

```shell
docker run -d -it --rm --name fvn-rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:3.13-management
```

- To run redis container in detached mode using docker image and default credentials

```shell
docker run -d --name fvn-redis -p 6379:6379 -d redis
```

- To run Keycloak container in detached mode using docker with default values

```shell
docker run -d -p 7080:8080 --name fvn-keycloak -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin quay.io/keycloak/keycloak:25.0.1 start-dev
```

- To push the image to docker hub registry (make sure you are logged in using docker cli or docker desktop)

```shell
docker image push docker.io/devmayank8/finvistanexus-accounts:1.0.1-SNAPSHOT
```

- To pull same the image from docker hub registry

```shell
docker pull devmayank8/finvistanexus-accounts:1.0.1-SNAPSHOT
```

- To show all the running and stopped containers

```shell
docker ps -a
```

- To stop all the running containers in docker

```shell
docker stop $(docker ps -a -q)
```

- To remove all the containers in docker

```shell
docker rm $(docker ps -a -q)
```

- To remove all the images in docker

```shell
docker rmi $(docker images -q)
```

- To login into the docker hub container registry

```shell
docker login -u <username>
```

- To logout from the docker hub container registry

```shell
docker logout
```

- To display the intermediate layers & cmds that were executed when building the image

```shell
docker history <image_name>
```

- To remove a particular docker image

```shell
docker rm <image_id>
```

- To remove all the dangling docker images

```shell
docker image prune -a
```

- To follow the log output of a particular container

```shell
docker conatiner logs -f <container_id>
```

- To open bash inside a running container

```shell
docker exec -it <container_name> bash
```

- To inspect a particular container

```shell
docker conatiner inspect <container_id>
```

- To show all the container statistics

```shell
docker container stats
```

- To remove all the stopped containers

```shell
docker conatiner prune
```

- To remove all the unused containers, volumes, networks and dangling images

```shell
docker system prune
```

- To display the disk usage info for the docker

```shell
docker system df
```

- To display the disk usage info for the docker along with breakdown

```shell
docker system df -v
```

- To list all the docker volumes on your system

```shell
docker volume ls
```

- To list all the docker networks on your system [3 n/ws : bridge (default), none and host]

```shell
docker network ls
```

- To inspect a particular network `bridge`

```shell
docker network inspect bridge
```

- To run a container `alpine-2` with `none` network and image as `alpine`

```shell
docker run --network=none --name alpine-2 alpine
```

- To run a MySQL container in the background with persistent storage, setting the root password, and naming the container `mysql-db`.

```shell
docker run -d -v /opt/data:/var/lib/mysql --name mysql-db -e MYSQL_ROOT_PASSWORD=db_pass123 mysql
```

- Create a new network named `wp-mysql-network` using the `bridge` driver. Allocate subnet `182.18.0.1/24`. Configure Gateway `182.18.0.1`

```shell
docker network create --driver bridge --subnet 182.18.0.1/24 --gateway 182.18.0.1 wp-mysql-network
```

- To run a container named `webapp` from the `kodekloud/simple-webapp-mysql` image, setting environment variables for database connection, attaching it to the `wp-mysql-network` network, mapping host port 38080 to container port 8080, and linking it to the `mysql-db` container.

```shell
docker run -d -e DB_HOST=mysql-db -e DB_PASSWORD=db_pass123 --network=wp-mysql-network -p 38080:8080 --link mysql-db:mysql-db --name webapp kodekloud/simple-webapp-mysql
```

### Docker Compose Commands

- To start the containers using a `docker-compose.yml` file

```shell
docker-compose up -d
```

- To stop and delete the containers including volumes

```shell
docker-compose down -v
```

- To stop the containers including volumes

```shell
docker-compose stop
```

---

## Kubernetes Commands

- NOTE: Make sure this path `C:\Program Files\Docker\Docker\Resources\bin\kubectl.exe` is present/added in your system PATH variables of Windows machine.

- Lists all the contexts available in your `kubeconfig` file. **Contexts** define _the cluster, user, and namespace_ to use for further kubectl commands.

```shell
kubectl config get-contexts
```

- Lists all the clusters defined in your `kubeconfig` file. **Clusters** are the _endpoints_ kubectl connects to for executing commands.

```shell
kubectl config get-clusters
```

- Switch the current context to <docker-desktop>. This is useful when you have multiple contexts and need to switch between them for different clusters or environments.

```shell
kubectl config use-context docker-desktop
```

- Creates and runs a new pod named `fvn-accounts` using the `devmayank8/finvistanexus-accounts:1.0.1-SNAPSHOT` image. The pod listens on port 8080.

```shell
kubectl run fvn-accounts --image=devmayank8/finvistanexus-accounts:1.0.1-SNAPSHOT --port=8080
```

- Displays information about the **Kubernetes cluster** and its version, along with the **Kubernetes API server** version.

```shell
kubectl cluster-info
```

- Displays information about the **nodes** in your **Kubernetes cluster**, including their status, roles, age, and version. Nodes are the physical or virtual machines that make up a Kubernetes cluster.

```shell
kubectl get nodes
```

## Modifying Run/Debug Configurations using spring profiles

- **NOTE**: Priority - CLI arguments > JVM options > Environment Variables

### Using CLI Arguments

- activating `prod` profile instead of default

```shell
--spring.profiles.active=prod
```

- activating `qa` profile instead of default spring profile and changing the value of `build.version`

```shell
--spring.profiles.active=prod --build.version=2.0.1
```

### Using JVM option of passing the arguments

- activating `qa` profile instead of default spring profile and changing the value of `build.version`

```shell
-Dspring.profiles.active=qa -Dbuild.version=3.0.1
```

### Using Environment variables

- activating `prod` profile instead of default spring profile and changing the value of `build.version`

```shell
SPRING_PROFILES_ACTIVE=prod;BUILD.VERSION=5.1.0;
```

## Apache benchmark cmd for load testing/rate limiter scenario

- Making 10 requests, with 2 concurrent requests at the given url

```shell
ab -n 10 -c 2 -v 3 http://localhost:8072/fvnbank/cards/api/contact-info
```

---

## Important Links

### Setting Up Your Spring Boot Project

#### 1. Create a Spring Boot Project
Kickstart your project using the [Spring Initializr](https://start.spring.io). This tool helps you generate a Spring Boot project with the necessary dependencies and configurations.

#### 2. Essential Tools and Dependencies

- **Spring Boot**: [Official Website](https://spring.io/projects/spring-boot)
- **Spring Cloud**: Extend your application with microservices support. [Spring Cloud Website](https://spring.io/projects/spring-cloud)

### Designing Your Application

#### 3. Applying Design Patterns
- **DTO Pattern**: Simplify data transfer across different parts of your application. Learn more about the [DTO Pattern](https://martinfowler.com/eaaCatalog/dataTransferObject.html).

#### 4. Mapping and Transformation

- **Model Mapper**: [Official Website](http://modelmapper.org/)
- **MapStruct**: [Official Website](https://mapstruct.org/)

#### 5. OpenAPI Integration

Document your APIs with ease using SpringDoc OpenAPI.

- **Spring Doc**: [Spring Doc Website](https://springdoc.org/)
- **OpenAPI**: [Open API Website](https://www.openapis.org/)

### Containerization and Deployment

#### 6. Docker and Containerization

- **Docker**: [Official Website](https://www.docker.com)
- **Docker Hub**: [Docker Hub Website](https://hub.docker.com)
- **Docker Compose**: Manage multi-container applications. [Docker Compose Website](https://docs.docker.com/compose/)
- **Buildpacks**: [Buildpacks Website](https://buildpacks.io)
- **Google Jib**: [Google Jib Website](https://github.com/GoogleContainerTools/jib)

#### 7. Kubernetes

Deploy and manage your applications at scale.

- **Local Kubernetes Cluster with Docker Desktop**: [Guide](https://docs.docker.com/desktop/kubernetes/)
- **Kubernetes Dashboard**: [Web UI Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)
- **Helm**: Manage Kubernetes applications. [Helm Website](https://helm.sh)
- **Spring Cloud Kubernetes**: [Spring Cloud Kubernetes Website](https://spring.io/projects/spring-cloud-kubernetes)

### Microservices and Messaging

#### 8. Microservices Architecture

- **Spring Cloud Config**: [Website](https://spring.io/projects/spring-cloud-config)
- **Spring Cloud Bus**: [Website](https://spring.io/projects/spring-cloud-bus)
- **Spring Cloud Netflix**: [Website](https://spring.io/projects/spring-cloud-netflix)
- **Spring Cloud OpenFeign**: [Website](https://spring.io/projects/spring-cloud-openfeign)
- **Resilience4j**: Implement fault tolerance. [Website](https://resilience4j.readme.io)
- **Spring Cloud Gateway**: [Website](https://spring.io/projects/spring-cloud-gateway)

#### 9. Messaging and Event-Driven Architecture

- **RabbitMQ**: [RabbitMQ Website](https://www.rabbitmq.com)
- **Apache Kafka**: [Apache Kafka Website](https://kafka.apache.org)
- **Docker Compose for Kafka**: [Docker Compose File](https://github.com/bitnami/containers/blob/main/bitnami/kafka/docker-compose.yml)

### Monitoring and Observability

#### 10. Metrics and Monitoring

- **Micrometer**: [Micrometer Website](https://micrometer.io)
- **Prometheus**: [Prometheus Website](https://prometheus.io/)
- **Grafana**: [Grafana Website](https://grafana.com)
- **Grafana Loki**: [Setup Guide](https://grafana.com/docs/loki/latest/getting-started/)

#### 11. Tracing and Observability

- **OpenTelemetry**: [OpenTelemetry Website](https://opentelemetry.io/)
- **Automatic Instrumentation**: [Guide](https://opentelemetry.io/docs/instrumentation/java/automatic/)

### Security

#### 12. Identity and Access Management

- **Keycloak**: [Keycloak Website](https://www.keycloak.org/)

### Advanced Topics and Best Practices

#### 13. Twelve-Factor App Methodology

Follow modern best practices for building software-as-a-service apps.

- **Twelve-Factor**: [Twelve-Factor Methodology](https://12factor.net)
- **Beyond the Twelve-Factor App**: [Book](https://www.oreilly.com/library/view/beyond-the-twelve-factor/9781492042631/)

#### 14. Event Storming

Design your domain-driven applications efficiently.

- **Lucidchart Blog**: [Event Storming Guide](https://www.lucidchart.com/blog/ddd-event-storming)

### Additional Resources

#### 15. Package Management and Build Tools

- **Chocolatey**: [Chocolatey Website](https://chocolatey.org/)
- **Bitnami Helm Charts**: [GitHub Repo](https://github.com/bitnami/charts)

#### 16. Cloud Platforms

Deploy your applications to the cloud.

- **Google Cloud Platform (GCP)**: [GCP Website](https://cloud.google.com)
- **GCP SDK Installation**: [Installation Guide](https://cloud.google.com/sdk/docs/install)

#### 17. Service Mesh

Implement service mesh for better microservices management.

- **Istio**: [Istio Website](https://istio.io)
