VERSION=9.1.2-ce.0
IP=0.0.0.0

if [ "$1" != "" ]; then
    VERSION=$1
fi

docker container run -d -ti \
--name gitlab \
--hostname gitlab \
--restart always \
-e GITLAB_OMNIBUS_CONFIG="external_url 'https://gitlab.indraports.com/';" \
-p ${IP}:80:80 \
-p ${IP}:443:443 \
-p ${IP}:22:22 \
-v gitlab_config:/etc/gitlab \
-v gitlab_logs:/var/log/gitlab \
-v gitlab_data:/var/opt/gitlab \
-v /etc/localtime:/etc/localtime \
gitlab/gitlab-ce:${VERSION}
