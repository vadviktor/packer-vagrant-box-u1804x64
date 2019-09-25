#!/bin/sh -x

su - vagrant -c "git clone --depth 1 https://github.com/rbenv/rbenv.git /home/vagrant/.rbenv"
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.bash_profile
echo -e '~/.rbenv/bin/rbenv init' >> /home/vagrant/.bash_profile
su - vagrant -c "mkdir -p "$(rbenv root)"/plugins"
su - vagrant -c "git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build"
apt update
apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
