#!/bin/sh -x

su - vagrant -c "git clone --depth 1 https://github.com/pyenv/pyenv.git /home/vagrant/.pyenv"
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> /home/vagrant/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> /home/vagrant/.bash_profile
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> /home/vagrant/.bash_profile
su - vagrant -c "git clone --depth 1 https://github.com/pyenv/pyenv-virtualenv.git /home/vagrant/.pyenv/plugins/pyenv-virtualenv"
echo 'eval "$(pyenv virtualenv-init -)"' >> /home/vagrant/.bash_profile
apt-get update
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev
