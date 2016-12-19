docker ps -a | awk {'print $NF'} | grep -v "^NAMES$" | sort
