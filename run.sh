#!/bin/bash

set -eo pipefail

export ETCD_PORT=${ETCD_PORT:-4001}
export ETCD_IP=${ETCD_IP:-172.17.42.1}
export ETCD=$ETCD_IP:$ETCD_PORT

echo "[nginx] booting container. ETCD: $ETCD."

until confd -onetime -node $ETCD -config-file /etc/confd/conf.d/nginx.toml; do
    echo "[nginx] waiting for confd to create initial nginx configuration."
    sleep 5
done

confd -interval 10 -node $ETCD -config-file /etc/confd/conf.d/nginx.toml &
echo "[nginx] confd is now monitoring etcd for changes..."

echo "[nginx] starting nginx service..."
/usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;"
