CONTAINER_LIST=$(docker ps -a -q)
VOLUME_TO_SEARCH=$1

for CONTAINER in $CONTAINER_LIST
do
    docker inspect -f '{{ json .Mounts }}' $CONTAINER | python -m json.tool | grep -i
$VOLUME_TO_SEARCH &>/dev/null
    if [ $? -eq 0 ]; then
        echo "Volume found in container $CONTAINER."
    fi
done
