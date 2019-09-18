# nodejs-nginx-mariadb-stack

## Install

1. Install [Docker](https://www.docker.com).
2. Run the commands
    ```
    cd ubuntu
    docker-compose build
    ```

## Setup

In your project, create a `docker-compose.yml` file like this:
```
version: '3'
services:
  my_fancy_service:
    image: nodejs-nginx-mariadb-stack
    container_name: my_fancy_container
    ports:
      - "80:80"
      - "3306:3306"
      - "9229:9229"
    volumes:
      - ".:/server/lib"
      - "~/Docker-data/creative_word_clouds/mysql:/var/lib/mysql"
```

(Port `80` is used by the NodeJS server, port `3306` by MariaDB and port `9229` for debugging in VSCode.)

You can then create a container based on this image by running `docker-compose up` inside your project.

The container will *not* automatically install the node modules found in your project's `package.json`. If you haven't already done so from the host machine, you can:

1. Start the container.
2. Attach to it from VSCode by right-clicking the container in the sidebar and selecting "Attach Shell".
3. Run the command
    ```
    npm install
    ```

*Please note*: some packages require that they are installed from the target machine directly because they are also compiled automatically, so we recommend following the steps above instead of simply running `npm install` from the host machine.
