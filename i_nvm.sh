#!/bin/bash
curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash
nvm install v0.10.33
tail -3 ~/.bashrc >> ~/.zshrc
nvm alias default v0.10.33
