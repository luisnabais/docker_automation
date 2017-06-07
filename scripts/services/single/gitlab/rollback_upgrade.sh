NEW_VERSION=$(grep "^VERSION=" CONFIG | cut -d'=' -f2)
OLD_VERSION=$(grep "^OLD_VERSION=" CONFIG | cut -d'=' -f2)
IMAGE_NAME=$(grep "^IMAGE_NAME=" CONFIG | cut -d'=' -f2)
NEW_IMAGE=$IMAGE_NAME:$NEW_VERSION
OLD_IMAGE=$IMAGE_NAME:$OLD_VERSION
CONTAINER_NAME=$(grep "^CONTAINER_NAME=" CONFIG | cut -d'=' -f2)

if [ "$1" != "" ]; then
    OLD_VERSION=$1
fi

echo "Getting Image ${OLD_IMAGE}..."
docker pull $OLD_IMAGE
echo ""

echo "Stopping container..."
docker container stop $CONTAINER_NAME
echo ""

echo "Removing container..."
docker container rm $CONTAINER_NAME
echo ""

echo "Starting new container..."
./run.sh $OLD_VERSION
echo ""

read -p "Remove newer image? (y/n) " yn
case $yn in
    [Yy]*) echo "Removing newer image..."; docker image rm $NEW_IMAGE;;
    [Nn]*) exit;;
    *) echo "Please answer y or n";;
esac
