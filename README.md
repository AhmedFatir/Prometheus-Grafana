
# Prom-Graf

## Project Overview
Monitoring System Using Prometheus, Grafana, AlertManager, and Exporters With Docker.

![](https://github.com/AhmedFatir/AhmedFatir/blob/master/images/Prom-Graf.png)

## Key Features
### Prometheus
Prometheus is an open-source monitoring and alerting toolkit designed for reliability and scalability. It collects and stores time-series data (metrics) from configured targets at specified intervals, allowing you to monitor various systems, applications, and services. Prometheus uses a powerful query language called PromQL to retrieve and analyze this data.

### Grafana
Grafana is an open-source analytics and interactive visualization platform. It allows you to create, explore, and share dashboards displaying real-time monitoring data from various sources, including Prometheus. Grafana supports a wide range of data sources and provides customizable and visually appealing graphs, charts, and alerts.

### AlertManager
AlertManager is a Component of the Prometheus ecosystem that handles alerts generated by Prometheus. It manages alert notifications by grouping, de-duplicating, and routing them to various communication channels like email, Slack, or PagerDuty. Alertmanager also supports silencing and inhibiting alerts to reduce noise.

### Exporters
Prometheus exporters are tools that collect metrics from various systems and applications, converting them into a format that Prometheus can scrape. Exporters provide a way to monitor components that do not natively expose metrics in Prometheus-compatible formats, like databases, hardware, or custom applications.

## Installation

### if you don't have docker and docker-compose on your machine
```bash
apt install curl

apt install docker.io

curl -O -J -L https://github.com/docker/compose/releases/download/v2.11.2/docker-compose-linux-x86_64

chmod +x docker-compose-linux-x86_64

cp ./docker-compose-linux-x86_64 /usr/bin/docker-compose
```

### if you already have docker and docker-compose installed on your machine
```bash
git clone https://github.com/AhmedFatir/Prom-Garfana.git

cd ./Prom-Garfana && make

# And then you can access
Garfana      https://localhost:3000/
Prometheus   https://localhost:9090/
AlertManager https://localhost:9093/
```
## If you are a 42 student who wants to run this project on the school's Mac, you may need to change the path where Docker Desktop stores its data.
```bash
# Make sure the Docker Desktop is not running.

# Use the rsync command to copy the Docker data directory to the new location.
rsync -a ~/Library/Containers/com.docker.docker ~/goinfre/DockerData

# Rename the original directory as a backup in case you need to revert(optional).
mv ~/Library/Containers/com.docker.docker ~/Library/Containers/com.docker.docker.backup

# Create a symbolic link from the new location back to the original location.
ln -s ~/goinfre/DockerData/com.docker.docker ~/Library/Containers/com.docker.docker

# Open Docker > Preferences > Resources > File Sharing > Add ~/goinfre to Shared Paths.
```
