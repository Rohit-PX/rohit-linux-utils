# .bashrc

# User specific aliases and functions
alias rm='rm -i'

alias cp='cp -i'

alias mv='mv -i'

alias vi='vim'

alias gitd='git ls-tree --no-commit-id --name-only -r"'

alias ipaddr='ip addr | grep 70.0'



# Source global definitions

if [ -f /etc/bashrc ]; then

. /etc/bashrc

fi



export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64

export EDITOR=vi

export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.1.0

export PATH=$PATH:/usr/local/bin/:$EC2_HOME/bin:/usr/local/go/bin:/opt/gccgo/bin:$HOME/git/go/bin/

export SHELL=bash

export GOPATH=/root/git/go

export WKSP=/root/git/go/src/github.com/portworx/px-test/

export TORP=/root/git/go/src/github.com/portworx/torpedo/

export SPW=/root/git/go/src/github.com/portworx/spawn/

export SCHEDOPS=/root/git/go/src/github.com/portworx/sched-ops/

export SRCH=/tmp/rk_search.sh

export JENK=/home/carson/jenkins/workspace/ROHIT-TEST/go/src/github.com/portworx/px-test/

export VGPATH=/mnt/disk5/

function auth() {

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/github_rsa

}

function setup_branch () {

# note WA is used in .vimrc to set tags.

    [ -z "${GOPATH}" ] && echo "Warning GOPATH not defined.  Resetting to ${HOME}/git/go." && export GOPATH=${HOME}/git/go

    export WA="${GOPATH}/src/github.com/$1"

    export CSCOPE_DB=${WA}/.cscope/cscope.out

export GDFS=${WA}/src/gdfs

export P=${WA}/storage

export B=${P}/disk/block

export O=$WA/daemon/graphdriver/overlay

export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:$WA/bin

export PATH=$PATH:$WA/h

cd $WA

}



function g() {



    [ -e "${HOME}/.px-user.env" ] && source ${HOME}/.px-user.env 

    

setup_branch portworx/$1

cd $WA

}



function d() {

setup_branch "docker/docker"

cd $WA

}



function make_tags() {

(

cd $WA

ctags -R .

mkdir $WA/.cscope

find $WA -name '*.c' -o -name '*.h' -o -name '*.cc' -o -name '*.cpp' -o -name '*go' > $WA/.cscope/cscope.files

cd $WA/.cscope

cscope -b

)

}



function doff() {

sudo systemctl stop docker  && \

sudo umount /dev/xvdg

}



function don() {

sudo rm -rf /var/lib/docker && \

sudo mkdir /var/lib/docker && \

sudo mount /dev/xvdg /var/lib/docker &&  \

sudo systemctl start docker

}



function pxdinstall() {

sudo install $WA/storage/bin/pxd /usr/local/bin/pxd

sudo install $WA/src/gdfs/pxd/px.ko /opt/pxd

sudo install $WA/src/gdfs/overlayfs/overlay.ko /opt/pxd

}



function tarc() {

if [ x"$1" == x ]; then

echo "usage: tarc <outputfile>"

else

tar  -cvzf $1 `git status | grep "modified\|new" | awk -F: '{print $2}'`

fi

}



function set_weave_env() {

    stat /usr/local/bin/weave &> /dev/null

    if [ $? -eq 0 ]; then

        eval $(/usr/local/bin/weave proxy-env)

    fi

}



# to use protoeasy for now, you must have docker installed locally or in a vm

# if running docker using docker-machine etc, replace 192.168.10.10 with the ip of the vm

# if running docker locally, replace 192.168.10.10 with 0.0.0.0

export PROTOEASY_ADDRESS=0.0.0.0:6789



export EDITOR=vim



launch-protoeasy() {

  docker rm -f protoeasy || true

    docker run -d -p 6789:6789 --name=protoeasy quay.io/pedge/protoeasy

}


export TERM="screen-256color" 

g px-test

alias sbh='source ~/.bashrc'

alias COI="docker images | grep none | awk {'print $3'} | xargs docker rmi"
alias VGM="cd $VGPATH; sshpass -p 'Password1' ssh vagrant@192.168.56.70"
alias VGSL1="cd $VGPATH; sshpass -p 'Password1'  ssh vagrant@192.168.56.71"
alias VGSL2="cd $VGPATH; sshpass -p 'Password1'  ssh vagrant@192.168.56.72"
alias VGSL3="cd $VGPATH; sshpass -p 'Password1'  ssh vagrant@192.168.56.73"
alias RKH="rm /root/.ssh/known_hosts"
alias CPY="/root/Documents/rohit_scripts/copy_ssh_keys.sh"
alias rmlogs="rm -rf /root/git/go/src/github.com/portworx/px-test/rk_logs/*"
alias vg="vagrant"
alias VD="cd /mnt/disk5/vagrant-kube"
alias cpst="echo 'y' | cp $JENK/stack/x86_instances.json $WKSP/stack/"
alias vbox='VBoxManage'

#Torpedo aliases
export DOCKER_HUB_REPO=rohitpx
export DOCKER_HUB_TORPEDO_IMAGE=torpedo
export DOCKER_HUB_TAG=latest
alias torpcred="~/Documents/rohit_scripts/torpedo_creds.sh"
alias mt="time make"
alias mtc="time make container"
alias mtcd="time make deploy"
alias dpl="time docker pull"

# Spawn aliases

alias KM="ssh root@70.0.146.177"
alias KS1="ssh root@70.0.146.176"
alias KS2="ssh root@70.0.146.178"
alias KS3="ssh root@70.0.146.179"
alias N1="ssh root@70.0.185.227"
alias N2="ssh root@70.0.185.228"
alias N3="ssh root@70.0.185.229"


#Git aliases
alias gs="git status"
alias pxt="time make px-test"
alias pxd="time make build-test"
alias gb="git branch"

#Docker aliases
alias di="docker images"
alias dl="cat  ~/ro_dock_pass.txt | docker login --username rohitpx --password-stdin"
alias dr="time docker rmi -f"
alias dpush="time docker push"
