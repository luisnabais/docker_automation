VERSION=$(grep "^VERSION=" CONFIG | cut -d'=' -f2)
CONTAINER_NAME=$(grep "^CONTAINER_NAME=" CONFIG | cut -d'=' -f2)
IMAGE_NAME=$(grep "^IMAGE_NAME=" CONFIG | cut -d'=' -f2)
IP=$(grep "^IP=" CONFIG | cut -d'=' -f2)

if [ "$1" != "" ]; then
    VERSION=$1
fi

docker container run -d -ti \
--name $CONTAINER_NAME \
--hostname $CONTAINER_NAME \
--restart always \
-e GITLAB_OMNIBUS_CONFIG="external_url 'https://gitlab.example.com/';" \
-p ${IP}:80:80 \
-p ${IP}:443:443 \
-p ${IP}:22:22 \
-v gitlab_config:/etc/gitlab \
-v gitlab_logs:/var/log/gitlab \
-v gitlab_data:/var/opt/gitlab \
-v /etc/localtime:/etc/localtime \
$IMAGE_NAME:${VERSION}
