FROM ubuntu:22.04

LABEL Description="Bring DPtech SSLVPN into docker"

ADD SSLVPN/LinuxPlugin.7z /tmp/LinuxPlugin.7z

RUN apt update && apt install -y p7zip-full
RUN 7z x /tmp/LinuxPlugin.7z -o/tmp/LinuxPlugin
RUN cd /tmp/LinuxPlugin/SSLVPNClientLinux && chmod +x install.sh && ./install.sh

ENTRYPOINT sslvpn_client_linux --connect
