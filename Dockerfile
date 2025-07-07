FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    supervisor \
    xfce4 \
    xfce4-terminal \
    chromium-browser \
    x11vnc \
    novnc \
    websockify \
    wget

RUN mkdir -p ~/.vnc && \
    x11vnc -storepasswd 1234 ~/.vnc/passwd

RUN mkdir -p /opt/novnc/utils/websockify && \
    wget https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz -O - | tar xz -C /opt && \
    mv /opt/noVNC-1.4.0/* /opt/novnc

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 6080

CMD ["/usr/bin/supervisord", "-n"]
