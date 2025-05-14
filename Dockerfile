FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 python3-pip novnc websockify \
    xfce4 x11vnc wget supervisor net-tools && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY utils/launch.sh /utils/launch.sh
RUN chmod +x /utils/launch.sh

EXPOSE 8080

CMD ["/utils/launch.sh"]
