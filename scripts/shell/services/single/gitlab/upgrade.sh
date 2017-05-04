NEW_VERSION=9.1.2-ce.0
FULL_VERSION=gitlab/gitlab-ce:$NEW_VERSION
CONTAINER_NAME=gitlab
OLD_IMAGE=$(docker container ls | grep $CONTAINER_NAME | awk {'print $2'})

if [ "$1" != "" ]; then
    NEW_VERSION=$1
fi

echo "Getting Image ${FULL_VERSION}..."
docker pull $FULL_VERSION
echo ""

echo "Stopping container..."
docker container stop $CONTAINER_NAME
echo ""

echo "Removing container..."
docker container rm $CONTAINER_NAME
echo ""

echo "Starting new container..."
./run.sh $NEW_VERSION
echo ""

read -p "Remove old image? (y/n) " yn
case $yn in
    [Yy]*) echo "Removing old image..."; docker image rm $OLD_IMAGE;;
    [Nn]*) exit;;
    *) echo "Please answer y or n";;
esac
