#! /bin/bash

confighome=$(pwd)
echo "linking config files to home directory"

rm ~/.vimrc && rm ~/.bashrc_luke && rm ~/.gitconfig
ln -s $confighome/vimrc ~/.vimrc
ln -s $confighome/bashrc ~/.bashrc_luke
ln -s $confighome/gitconfig ~/.gitconfig

echo "~~~ Configuring ssh key"
cd ~
if [[ ! -d .ssh ]]
then
	mkdir .ssh
fi

cd .ssh
if [[ ! -f id_rsa.pub ]]
then
	ssh-keygen -t rsa -C 'stanford.luke.nz@gmail.com'
fi


echo "~~~~ Installing autocomplete for git n bash"
cd ~
if [[ ! -f .git-completion.sh ]]
then
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O .git-completion.sh
fi

cd $confighome
echo 'consider running : echo "source ~/.bashrc_luke" >> ~/.bashrc'
