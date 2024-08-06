FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget curl \
    ca-certificates \
    gnupg \
    openssl \
    apt-transport-https \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Create Prometheus user and directories
RUN useradd --no-create-home --shell /bin/false prometheus \
    && mkdir -p /etc/prometheus /var/lib/prometheus \
    && chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus

# Download and install Prometheus
RUN wget https://github.com/prometheus/prometheus/releases/download/v2.40.0/prometheus-2.40.0.linux-amd64.tar.gz \
    && tar -xvzf prometheus-2.40.0.linux-amd64.tar.gz \
    && cp prometheus-2.40.0.linux-amd64/prometheus /usr/local/bin/ \
    && cp prometheus-2.40.0.linux-amd64/promtool /usr/local/bin/ \
    && cp -r prometheus-2.40.0.linux-amd64/consoles /etc/prometheus/ \
    && cp -r prometheus-2.40.0.linux-amd64/console_libraries /etc/prometheus/ \
    && cp prometheus-2.40.0.linux-amd64/prometheus.yml /etc/prometheus/ \
    && chown -R prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool /etc/prometheus/consoles /etc/prometheus/console_libraries \
    && rm -rf prometheus-2.40.0.linux-amd64*

# Generate a self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/prometheus/prometheus.key \
    -out /etc/prometheus/prometheus.crt \
    -subj "/C=MO/ST=KH/L=KH/O=1337/OU=1337/CN=localhost/UID=user"

RUN chown prometheus:prometheus /etc/prometheus/prometheus.key /etc/prometheus/prometheus.crt \
    && chmod 600 /etc/prometheus/prometheus.key /etc/prometheus/prometheus.crt

EXPOSE 9090

# Set Prometheus config directory
WORKDIR /etc/prometheus

# Run Prometheus as a non-root user
USER prometheus

# Start Prometheus
CMD ["/usr/local/bin/prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/var/lib/prometheus", "--web.listen-address=:9090", "--web.config.file=/etc/prometheus/web-config.yml"]
