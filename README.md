# Container-tools

- [Table Contents](#)
- [Intro](#Intro)
- [Prerequisites](#Prerequisites)
- [container-enter](#container-enter)
- [container-mount-volumes](#container-mount-volumes)
- [Reference](#Reference)
- [Licence](#Licence)

#### Intro

- enter linux container like [garden](https://github.com/cloudfoundry-incubator/garden-linux) or [docker](https://github.com/docker/docker).
- dynamic mount volumes for running container

#### Prerequisites

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

- Others
	- any one VM that is allow to access the container VM
	- create a garden container
	- create a docker container

#### container-enter

- install [container-enter](http://code.huawei.com/l00177705/container-enter/blob/master/src/container-enter)

	install container-enter in the container VM.

	```shell
./install.sh /usr/bin
	```

- enter-container

	- HELP

	```shell
	container-enter --help

	Usage: container-enter OPTIONS

  	-t,--type <container type>         the connecting container type,only support garden and docker currently.
  	-i,--id   <container id>           the connecting container id.
  	-u,--user [container user]         User to change to in the connecting container.
  	-c,--command ["execute command"]   you can give some command that will run in specified container,You can specify multiple -c arguments.

	-h,--help   display this help and exit

	```

	- login specify container on other VM

	```shell
	ssh -t -i ~/.ssh/<VM-USER-PRIVATE-KEY> <VM-USER>@<VM-IP> LocalCommand=" container-enter --type <CONTAINER-TYPE> --id <CONTAINER-ID> --user <CONTAINER-USER>"
	```

	- login specify container on the same VM

	```shell
	container-enter --type <CONTAINER-TYPE> --id <CONTAINER-ID> --user <CONTAINER-USER>
	```

	- run some command in continer

    ```shell
    container-enter --type <CONTAINER-TYPE> --id <CONTAINER-ID> --command "ls -al"
    ```

#### container-mount-volumes

- how to mount local volumes

	we can use [container-mount-volumes](http://code.huawei.com/l00177705/container-enter/blob/master/src/container-mount-volumes) dynamic mount local volumes for running container.

	- HELP

	```shell
	container-mount-volumes --help

    Usage: container-mount-volumes OPTIONS

      -t,--type <container type>                    the connecting container type,only support garden and docker currently.
      -i,--id   <container id>                      the connecting container id
      -v,--volumes [volumes,host:container]         volumes which will be dynamic mount to specify container,You can specify multiple -v arguments.
      -c,--command ["execute command"]              you can give some command that will run in specified container,You can specify multiple -c arguments.

      -h,--help   display this help and exit

	```

    - mount volumes for running container

    ```shell
    container-mount-volumes --type <CONTAINER-TYPE> --id <CONTAINER-ID> --volumes <HOST-PATH>:<CONT-PATH>
    ```
- mount remote volumes

	we can use `container-mount-volumes -c command` dynamic mount remote volumes for running container.

    ```shell
container-mount-volumes --type <CONTAINER-TYPE> --id <CONTAINER-ID> --command "mkdir -p /testnfs;mount -t nfs <NFS-HOST>:/home/nfs /testnfs"
    ```

#### Reference
- [nsenter](https://www.kernel.org/pub/linux/utils/util-linux/),linux namespace utils
- [nsattach](https://github.com/guanglinlv/nsattach),nsenter from util-linux with pseudo tty support
- [docker-enter](https://github.com/jpetazzo/nsenter),nsenter with docker
- [Attach a volume to a container while it is running](http://jpetazzo.github.io/2015/01/13/docker-mount-dynamic-volumes/)


## Licence

Copyright (c) 2015, lvguanglin <guanglinlv@gmail.com>

All rights reserved.
