
all: apt git

apt:
	sudo apt-get update -y
	sudo update-alternatives --set editor /usr/bin/vim.basic
#sudo apt-get upgrade -y
	sudo apt-get install -y build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl openssh-server redis-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev logrotate

git:
	sudo apt-get install -y libcurl4-openssl-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
	git --version
	cd /tmp
	curl --progress https://git-core.googlecode.com/files/git-1.8.5.2.tar.gz | tar xz
	cd git-1.8.5.2/
	make prefix=/usr/local all
	sudo make prefix=/usr/local install
	git --version

# EOF

