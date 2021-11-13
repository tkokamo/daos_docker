FROM daos:latest

RUN sudo yum install -y wget fuse3
RUN wget -P /opt/daos/examples/ https://raw.githubusercontent.com/daos-stack/daos/release/1.2/utils/config/daos_agent.yml

COPY ["daos_server_local.yml", "/opt/daos/examples/"]
COPY ["daos_start.sh", "/home/daos/"]

CMD ["bash", "daos_start.sh"]


