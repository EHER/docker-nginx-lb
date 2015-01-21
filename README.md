#nginx-lb
[Docker] image to boot up a load balance based on [Nginx] with [Confd] reading from [Etcd].

[![nodesource/node](http://dockeri.co/image/eher/nginx-lb)](https://registry.hub.docker.com/u/eher/nginx-lb/)

```
etcdctl set /nginx-lb/server/blog/server_name example.com
etcdctl set /nginx-lb/server/blog/upstream/1 127.0.0.1:8080
etcdctl set /nginx-lb/server/blog/upstream/2 127.0.0.1:8081
docker run -p 80:80 -e ETCD_IP=172.17.42.1 -d eher/nginx-lb
```

[Docker]: https://www.docker.com/
[Nginx]: http://nginx.org/
[Confd]: https://github.com/kelseyhightower/confd
[Etcd]: https://github.com/coreos/etcd
