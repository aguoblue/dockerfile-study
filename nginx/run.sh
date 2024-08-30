docker pull nginx:latest

docker run --name nginx-container \
  -p 80:80 \
  -v /yourpath/data/nginx/www:/usr/share/nginx/html \
  -v /yourpath/data/nginx/conf.d:/etc/nginx/conf.d \
  -d nginx:latest


  # --network host \

    # -p 80:80 \