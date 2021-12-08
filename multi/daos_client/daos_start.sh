#/bin/bash

# start daos_agent
sudo /opt/daos/bin/daos_agent -i -o /home/daos/daos_agent.yml &

# wait a bit for the server starting
sleep 20

# create pool and container
POOLID=`dmg pool create -i --ranks=0 --scm-size=8G | grep UUID | awk '{print $3}'`
CONTID=`daos cont create --pool=${POOLID} --type=POSIX | awk '{print $4}'`

cd /home/daos/
mkdir dfuse
dfuse --mountpoint dfuse --pool=${POOLID} --container=${CONTID}

wait
