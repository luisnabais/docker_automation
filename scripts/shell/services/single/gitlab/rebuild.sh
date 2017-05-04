CONTAINER_NAME=gitlab
VERSION=$(docker container ls | grep $CONTAINER_NAME | awk {'print $2'} | cut -d':' -f2)

echo "Stopping container..."
docker container stop $CONTAINER_NAME
echo ""

echo "Removing container..."
docker container rm $CONTAINER_NAME
echo ""

echo "Starting container..."
./run.sh $VERSION
echo ""
