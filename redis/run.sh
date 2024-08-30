docker run --name my-redis \
-v /yourpath/data/redis/conf/redis.conf:/usr/local/etc/redis/redis.conf \
-v /yourpath/data/redis/data:/data \
-p 6379:6379 \
-d redis redis-server /usr/local/etc/redis/redis.conf
