# container-enter
enter linux container like garden or docker.

- container types
	- [garden](https://github.com/cloudfoundry-incubator/garden-linux),garden-linux backend
	- [docker](https://github.com/docker/docker),docker-linux backend
	
- nsenter
	- [nsenter](https://www.kernel.org/pub/linux/utils/util-linux/)
		
		```shell
		wget https://www.kernel.org/pub/linux/utils/util-linux/v2.26/util-linux-2.26.2.tar.gz --no-check-certificate
		tar zxf util-linux-2.26.2.tar.gz
		cd util-linux-2.26.2
		./configure --without-ncurses
		make LDFLAGS=-all-static nsenter
		cp nsenter /usr/bin/
		```
		
	- [nsattach](https://github.com/guanglinlv/nsattach)
		
		nsattach is Fork of nsenter from util-linux with pseudo tty support for interactive usage.
	
- environment
	- any one VM that is allow to access the container VM
	- create a garden container
	- create a docker container
	
- ssh-container
	install ssh-container.
	
	```shell
	tar zxf ssh-container.tgz
	cd ssh-container.tgz
	./install.sh /usr/bin
	```
	
- login in
	
	- login specify container on other VM
	
	```shell
	ssh -t -i ~/.ssh/<VM-USER-PRIVATE-KEY> <VM-USER>@<VM-IP> LocalCommand=" container-enter --type <CONTAINER-TYPE> --id <CONTAINER-ID> --user <CONTAINER-USER>"
	```
	
	- HELP
	
	```shell
	ssh -t -i ~/.ssh/<VM-USER-PRIVATE-KEY> <VM-USER>@<VM-IP> LocalCommand=" container-enter --help"
	
	Usage: /usr/bin/ssh-container OPTIONS
	
	-t,--type <container type>     the connecting container type,only support garden and docker currently.
	-i,--id   <container id>       the connecting container id
	-u,--user [container user]     User to change to in the connecting container.
	
	-h,--help   display this help and exit
	```
	
	- login specify container on the same VM
	
	```shell
	container-enter --type <CONTAINER-TYPE> --id <CONTAINER-ID> --user <CONTAINER-USER>
	```
	
