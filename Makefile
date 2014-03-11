

SUGIT=
GITHOME=$(HOME)/
all: apt git user gitlab-shell database

apt:
	pwd
	sudo apt-get update -y
	sudo update-alternatives --set editor /usr/bin/vim.basic
#sudo apt-get upgrade -y
	sudo apt-get install -y build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl openssh-server redis-server checkinstall libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev logrotate

git:
	git --version
	# sudo apt-get install -y libcurl4-openssl-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
	# cd /tmp
	# curl --progress https://git-core.googlecode.com/files/git-1.8.5.2.tar.gz | tar xz
	# cd git-1.8.5.2/
	# make prefix=/usr/local all
	# sudo make prefix=/usr/local install
	# git --version


user:
	sudo adduser --disabled-login --gecos 'GitLab' git

gitlab-shell:
	cd $(HOME)
	ls -lad .
	$(SUGIT) git clone https://gitlab.com/gitlab-org/gitlab-shell.git -b v1.8.0
	cd gitlab-shell
	$(SUGIT) cp config.yml.example config.yml
# # Edit config and replace gitlab_url
# # with something like 'http://domain.com/'
#	$(SUGIT) editor config.yml
	$(SUGIT) ./bin/install

database:
	pwd
	sudo apt-get install -y postgresql-9.1 postgresql-client libpq-dev
	sudo -u postgres psql -d template1 < postgress.in
	$(SUGIT) psql -d gitlabhq_production
