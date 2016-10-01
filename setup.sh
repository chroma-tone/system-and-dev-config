#! /bin/bash

confighome=$(pwd)
echo "linking config files to home directory"

rm ~/.vimrc && rm ~/.bashrc_luke && rm ~/.gitconfig
ln -s $confighome/vimrc ~/.vimrc
ln -s $confighome/bashrc ~/.bashrc_luke
ln -s $confighome/gitconfig ~/.gitconfig
ln -s $confighome/tmux.conf ~/.tmux.conf

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

if [[ ! -d ~/.nvm ]]
then
	wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
fi

if [[ ! -d ~/.vim/bundle ]]
then
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
		 curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

	cd ~/.vim/bundle
	git clone https://github.com/scrooloose/nerdtree.git
fi

if [[ ! -d ~/.vim/colors ]]
then
	mkdir -p ~/.vim/colors
	cd ~/.vim/colors
	git clone git@github.com:Lokaltog/vim-distinguished.git
	mv vim-distinguished/colors/distinguished.vim ./
	rm -rf vim-distinguished
fi
cd $confighome
echo '~~~~ Consider running: echo "source ~/.bashrc_luke" >> ~/.bashrc'
