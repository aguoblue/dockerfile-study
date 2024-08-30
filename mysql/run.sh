docker run --name mysql-container \
  -e MYSQL_ROOT_PASSWORD=123456 \
  -p 3306:3306 \
  -v /yourpath/data/mysql/log:/var/log/mysql \
  -v /yourpath/data/mysql/data:/var/lib/mysql \
  -v /yourpath/data/mysql/conf:/etc/mysql/conf.d \
  -d mysql:5.7
