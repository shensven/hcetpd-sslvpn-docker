# hcetPD SSLVPN Docker

[![Push](https://github.com/shensven/hcetpd-sslvpn-docker/actions/workflows/push.yaml/badge.svg?branch=main)](https://github.com/shensven/hcetpd-sslvpn-docker/actions/workflows/push.yaml)
![Docker Pulls](https://img.shields.io/docker/pulls/shensven/hcetpd-sslvpn)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/shensven/hcetpd-sslvpn/latest)

Bring DPtech SSLVPN into docker

## Config

```xml
<!-- sslvpn.xml -->

<?xml version="1.0" encoding="utf-8" ?>
<vpn_info IP="10.10.10.192" port="6443" username="your_username" password="your_hashed_passwd" debug_info="1" always_online="0" launch_at_startup="0" use_gmssl="0" tunnel_type="1"/>
```

Password is hashed using base64.

## Usage

### Direct run

```bash
docker pull shensven/hcetpd-sslvpn
docker run -i -t shensven/hcetpd-sslvpn -p 22:22 -v ./sslvpn.xml:/etc/sslvpn.conf
```

### Docker compose

```yaml
# docker-compose.yaml

version: "3.9"
services:
  hcetpd_sslvpn:
    image: shensven/hcetpd-sslvpn
    tty: true
    ports:
      - "22:22"
    volumes:
      - ./sslvpn.xml:/etc/sslvpn.conf
```

```bash
 docker-compose up
```
