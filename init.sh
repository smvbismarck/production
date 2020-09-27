if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
mkdir postgres-data
mkdir grafana
mkdir influxdb
chmod 472 grafana
echo "Enter the url of the influx database:"
read influx
curl -XPOST '$influx/query' --data-urlencode 'q=CREATE DATABASE "traefik"
