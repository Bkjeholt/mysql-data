#/bin/bash -f

docker run -d \
                --restart=always \
                --name hic-mysql-data \
                mysql-data:latest tail -f /dev/null
