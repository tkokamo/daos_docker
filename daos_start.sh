#/bin/bash

# start daos_server and daos_agent
sudo /opt/daos/bin/daos_server start -o /opt/daos/examples/daos_server_local.yml &
sudo /opt/daos/bin/daos_agent -i -o /opt/daos/examples/daos_agent.yml &

# wait a bit for the server starting
sleep 5

# format PMEM
dmg -i storage format
# create pool and container
sleep 10
POOLID=`dmg pool create -i --ranks=0 --scm-size=8G | grep UUID | awk '{print $3}'`
CONTID=`daos cont create --pool=${POOLID} --type=POSIX | awk '{print $4}'`

mkdir dfuse
dfuse --mountpoint dfuse --pool=${POOLID} --container=${CONTID}

wait
