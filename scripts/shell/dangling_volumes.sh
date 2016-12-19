#!/bin/sh

docker volume ls -qf dangling=true
#ORPHAN_VOLUMES=$(docker volume ls -qf dangling=true)
#VOLUME_PATH=/var/lib/docker/volumes


#for VOLUME in $ORPHAN_VOLUMES
#do
    #echo $VOLUME
    #find_volume $VOLUME
    #docker volume inspect $VOLUME
    #ls -lha ${VOLUME_PATH}/${VOLUME}/_data/
#done


# DELETE DANGLING VOLUMES
# docker volume rm $(docker volume ls -qf dangling=true)
# docker volume ls -qf 'dangling=true' | xargs docker volume rm
