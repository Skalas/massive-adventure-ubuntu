#!/bin/bash
curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash
tail -3 ~/.bashrc >> ~/.zshrc
source ~/.zshrc
nvm install v0.10.33
nvm alias default v0.10.33
