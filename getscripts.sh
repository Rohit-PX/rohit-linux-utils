echo "Downloading scripts...."
mkdir -p /root/rkscripts/storkscripts/
mkdir -p /root/rkscripts/torpscripts/
scp root@70.0.0.94:/root/Downloads/rkbkp/ClusterScripts/storkscripts/*  /root/rkscripts/storkscripts/
scp root@70.0.0.94:/root/Downloads/rkbkp/ClusterScripts/torpscripts/*  /root/rkscripts/torpscripts/
scp root@70.0.0.94:/root/Downloads/rkbkp/ClusterScripts/bashrc   ~/.bashrc
mkdir ~/.vim
git clone https://github.com/flazz/vim-colorschemes.git ~/.vim
