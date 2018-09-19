#!/bin/bash
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> $HOME/.zshrc
echo 'eval "$(pyenv init -)"'  >> $HOME/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.zshrc
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(pyenv init -)"'  >> $HOME/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.bashrc

