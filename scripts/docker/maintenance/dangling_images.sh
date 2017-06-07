# LIST DANGLING IMAGES
docker images -qf 'dangling=true'

# DELETE DANGLING IMAGES
# docker images -qf 'dangling=true' | xargs docker rmi
