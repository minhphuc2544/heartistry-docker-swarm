# Heartistry's services simple deployment via Docker Compose

![Docker](https://img.shields.io/badge/docker-ready-blue?logo=docker)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-v13.5-blue?logo=postgresql)
![MySQL](https://img.shields.io/badge/MySQL-Latest-blue?logo=mysql)
![NGINX](https://img.shields.io/badge/nginx-ready-brightgreen?logo=nginx)
![Node.js](https://img.shields.io/badge/Node.js-User--Service-brightgreen?logo=node.js)
![Java](https://img.shields.io/badge/Java-Task--Service-red?logo=java)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-Task--Service-green?logo=spring)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI/CD-blue?logo=githubactions)
![License](https://img.shields.io/github/license/minhphuc2544/heartistry-docker-swarm)

This project provides a simple solution for deploying the Heartistry application using Docker Compose.

# Descriptions
<image src="./deployment_model.svg"></input>
Heartistry's services are deployed using a set of Docker Swarm stacks to handle various components:
- **MySQL Database**: Used for task's data storage.
- **PostgreSQL Database**: Used for user's data storage.
- **User's APIs**: Developed with NestJS, these APIs handle user-related operations such as authentication, user profiles, and other user-centric features.
- **Task's APIs**: Built with Spring Boot, these APIs manage English learning tasks, including vocabulary, sentences, and exercises.
- **Nginx**: Proxy service.

## Prerequisites
[Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04) is the only tool needed to deploy this project.

## Installations
```bash
git clone https://github.com/minhphuc2544/heartistry-docker-swarm
cd heartistry-docker-swarm
git checkout simple-deploy
git submodule update --init --recursive
./scripts/create-dockerfiles.sh
./scripts/replace-for-deploy.sh
```

## Deployments
```bash
cd heartistry-docker-swarm
docker compose up -d
```

# License

This project is licensed under the [Apache License 2.0](LICENSE). See the `LICENSE` file for details.

# Credits
Special thanks to our lecturer - [Le Anh Tuan](https://github.com/tuan-devops), University of Information Technology (UIT), Vietnam National University, Ho Chi Minh City (VNU-HCM). The group members are:
- Vo Tran Phi (Student ID: 22521081)  
Github link: [votranphi](https://github.com/votranphi) 
- Le Duong Minh Phuc (Student ID: 22521116)  
Github link: [minhphuc2544](https://github.com/minhphuc2544)