#  Strapi -Task 1  

This repository contains my completed task for the PearlThoughts Internship Program.  
I have created a **Strapi application** with a BlogPost content type and added entries as part of the assignment.


## Project Overview
- Cloned a Strapi  project locally
- Added a **BlogPost collection type** with the following fields:
  - Title (Text)
  - Rich Text Content
  - Quote (Component)
- Published sample content entries in the Strapi admin panel.
- Initialized Git for version control and pushed changes into a dedicated branch.



## Steps I Followed
1. Installed **Node.js** and **npm**.
2. Installed **Git** and cloned the organization repository.
3. Created a Strapi project:
   ```bash
   npx create-strapi-app@latest my-strapi-project
4.Logged into the Strapi admin panel and created BlogPost entries.

5.Committed the project code and pushed it to my own branch.


#  Strapi  Dockerized Setup -Task 2
# Strapi Project – Dockerized Setup

This project containerizes a Strapi CMS application using **Dockerfile** and **docker-compose**.



##  Steps to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/Jushline/strapi-task-1.git
   cd strapi-task-1/my-strapi-project```


2. Build and start containers:

   ```bash
   docker-compose up --build
   ```

3. Access Strapi in your browser:

   ```
   http://localhost:1337
   ```

---

##  Files Explained

### 1. `Dockerfile`

* Defines how the Strapi app image is built.
* Uses **node:18-alpine** as base.
* Installs dependencies and copies project files.
* Exposes port `1337` for Strapi.
* Runs `npm run develop` to start Strapi in dev mode.

### 2. `docker-compose.yml`

* Defines services and links.
* Runs Strapi container using the above `Dockerfile`.
* Mounts local code so changes reflect without rebuilding.
* Maps port `1337` on container → `1337` on host.

---

## Challenges Faced

* Initially got error: `no configuration file provided: not found` → solved by placing `docker-compose.yml` in project root.
* Container failed to start until we fixed correct `working_dir`.
* Learned difference between **image build** and **container run**.



##  Outcome

* Strapi now runs successfully inside a Docker container.
* Can be started anytime with:

  ```bash
  docker-compose up
  ```



