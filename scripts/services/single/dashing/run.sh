VERSION=$(grep "^VERSION=" CONFIG | cut -d'=' -f2)
IP=$(grep "^IP=" CONFIG | cut -d'=' -f2)
IMAGE_NAME=$(grep "^IMAGE_NAME=" CONFIG | cut -d'=' -f2)
CONTAINER_NAME=$(grep "^CONTAINER_NAME=" CONFIG | cut -d'=' -f2)

docker run -ti -d \
--name $CONTAINER_NAME \
--restart always \
-p $IP:8080:3030 \
-v dashing_dashboards:/dashboards \
-v dashing_jobs:/jobs \
-v dashing_config:/config \
-v dashing_widgets:/widgets \
-v dashing_assets:/assets \
-v dashing_lib:/lib-dashing \
-v dashing_public:/public \
$IMAGE_NAME:$VERSION
