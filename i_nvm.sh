#!/bin/bash
curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash
tail -3 ~/.bashrc >> ~/.zshrc
source ~/.bashrc
nvm install v0.12.2
nvm alias default v0.12.2
