1. Build base image

```
sudo docker build https://github.com/daos-stack/daos.git#release/1.2 \
        -f utils/docker/Dockerfile.centos.7 -t daos
```

2. Build server image 

```
sudo docker build daos_server/ -t daos_server
```

3. Build client image

```
sudo docker build daos_server/ -t daos_server
```

4. Start containers

```
sudo docker-compose up -d
```

5. Login to the client

```
sudo docker exec -it multi_client_1 /bin/bash
[daos_server@92744ee002db ~]$ df
Filesystem     1K-blocks      Used Available Use% Mounted on
overlay        959863856 165900896 745134752  19% /
tmpfs           49402308         0  49402308   0% /sys/fs/cgroup
udev            49367476         0  49367476   0% /dev
shm                65536         0     65536   0% /dev/shm
/dev/nvme0n1p2 959863856 165900896 745134752  19% /etc/hosts
dfuse            7812500       144   7812357   1% /home/daos/dfuse
[daos_server@92744ee002db ~]$ dd if=/dev/zero of=dfuse/file bs=1M count=1024
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB) copied, 0.764613 s, 1.4 GB/s
[daos_server@92744ee002db ~]$ dd if=/dev/zero of=dfuse/file bs=1M count=1024 oflag=direct
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB) copied, 0.75373 s, 1.4 GB/s
```


