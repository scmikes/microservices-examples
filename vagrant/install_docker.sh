    # remove old version of docker on centos 7
    yum remove docker docker-common docker-selinux docker-engine

    # add required packages
    yum install -y yum-utils device-mapper-persistent-data lvm2
    

    # setup repository for docker-ce
    yum-config-manager --add-repo  https://download.docker.com/linux/centos/docker-ce.repo

    # install docker-ce from docker repository
    yum install -y docker-ce

    #create docker group and add user running script to docker group
    groupadd docker
    usermod -aG docker vagrant
    
    # install docker-compose
    curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose


    # setup docker to start at reboot
    systemctl start docker
    systemctl enable docker