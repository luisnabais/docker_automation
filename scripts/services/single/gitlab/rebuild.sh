CONTAINER_NAME=$(grep "^CONTAINER_NAME=" CONFIG | cut -d'=' -f2)
VERSION=$(grep "^VERSION=" CONFIG | cut -d'=' -f2)

echo "Stopping container..."
docker container stop $CONTAINER_NAME
echo ""

echo "Removing container..."
docker container rm $CONTAINER_NAME
echo ""

echo "Starting container..."
./run.sh $VERSION
echo ""
