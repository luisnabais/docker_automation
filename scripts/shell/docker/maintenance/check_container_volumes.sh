CONTAINERS_LIST=$()

for CONTAINER in $CONTAINER_LIST
do
    echo $CONTAINER
    #./list_mounts.sh $CONTAINER | grep "Name" | cut -d':' -f2 | tr -d '," '
    VOLUMES=$(./volume_list.sh $CONTAINER | grep "Name" | cut -d':' -f2 | tr -d '," ')
    for VOLUME in $VOLUMES
    do
        echo -en "\t$VOLUME - "
        [ -d /var/lib/docker/volumes/${VOLUME}/_data/ ] && echo 'OK' || echo 'Folder does not exist'
    done
done
