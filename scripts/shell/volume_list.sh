docker inspect -f '{{ json .Mounts }}' $1 | python -m json.tool
