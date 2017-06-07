VERSION=$(grep "^VERSION=" CONFIG | cut -d'=' -f2)
CONTAINER_NAME=$(grep "^CONTAINER_NAME=" CONFIG | cut -d'=' -f2)
IMAGE_NAME=$(grep "^IMAGE_NAME=" CONFIG | cut -d'=' -f2)
IP=$(grep "^IP=" CONFIG | cut -d'=' -f2)

if [ "$1" != "" ]; then
    VERSION=$1
fi

docker container run -d \
--restart=always \
--name $CONTAINER_NAME \
-p $IP:8080:9000 \
-v /var/run/docker.sock:/var/run/docker.sock \
$IMAGE_NAME:$VERSION \
