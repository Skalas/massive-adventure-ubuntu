#!/bin/bash
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
echo 'export PATH="/home/skalas/.pyenv/bin:$PATH"' >> .zshrc
echo 'eval "$(pyenv init -)"'  >> .zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> .zshrc
echo 'export PATH="/home/skalas/.pyenv/bin:$PATH"' >> .bashrc
echo 'eval "$(pyenv init -)"'  >> .bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> .bashrc
