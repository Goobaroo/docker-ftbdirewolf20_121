# syntax=docker/dockerfile:1

FROM openjdk:21-jdk-buster

LABEL version="1.13.1"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Presents Direwolf20 1.21"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/d9/d9e1ac17b1232176575ee10154dddea0110a26cc2f048c461a1ef288931624c5.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTB-Direwolf20-1.21:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Presents Direwolf20 1.21 v1.13.1 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]