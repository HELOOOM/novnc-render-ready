FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Met à jour l'image et installe les dépendances essentielles sans paquets cassés
RUN apt-get update && \
    apt-get install -y python3 python3-pip wget net-tools x11vnc xfce4 websockify supervisor curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Télécharge manuellement noVNC et novnc_proxy (version stable)
RUN mkdir -p /opt/novnc && \
    wget https://github.com/novnc/noVNC/archive/refs/heads/master.zip -O /tmp/novnc.zip && \
    unzip /tmp/novnc.zip -d /opt && \
    mv /opt/noVNC-master/* /opt/novnc && \
    ln -s /opt/novnc/utils/novnc_proxy /usr/bin/novnc_proxy

# Copie ton script de lancement
COPY utils/launch.sh /utils/launch.sh
RUN chmod +x /utils/launch.sh

EXPOSE 8080

CMD ["/utils/launch.sh"]
