Standalone DAOS server and client

### Usage

1. Emulate persistent memory if your system does not have the one

See [pmem.io](https://pmem.io/2016/02/22/pm-emulation.html)

2. Build daos docker image according to the [official documentation](https://docs.daos.io/admin/installation/#daos-in-docker)

```bash
$ docker build https://github.com/daos-stack/daos.git#release/1.2 \
        -f utils/docker/Dockerfile.centos.7 -t daos
```

2. Build custom image

```bash
$ docker build . -t cdaos
```

3. Start container

```bash
$ docker run -it -d --privileged --cap-add=ALL --name cd -v /dev:/dev cdaos
```

Wait a bit until the setup completes.

4. Connect to the container

```bash
$ docker exec -it cd /bin/bash
[daos_server@8e82f11b921b ~]$ df
Filesystem     1K-blocks      Used Available Use% Mounted on
overlay        959863856 164584824 746450824  19% /
tmpfs           49402312         0  49402312   0% /sys/fs/cgroup
udev            49367476         0  49367476   0% /dev
tmpfs           49402312         4  49402308   1% /dev/shm
/dev/nvme0n1p2 959863856 164584824 746450824  19% /etc/hosts
tmpfs           33554432   8992188  24562244  27% /mnt/daos
dfuse            7812500   2139249   5673252  28% /home/daos/dfuse
[daos_server@8e82f11b921b ~]$ dd if=/dev/zero of=dfuse/file bs=1M count=1024 oflag=direct
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB) copied, 0.763984 s, 1.4 GB/s
```
