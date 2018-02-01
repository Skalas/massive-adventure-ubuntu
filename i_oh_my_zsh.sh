#!/bin/bash
sudo apt install -y zsh tmux fortune
curl -L git.io/antigen > ~/antigen.zsh
cp config_files/zshrc ~/.zshrc
cat config_files/env_vars >> ~/.env_vars
cp config_files/aliases ~/aliases
chsh -s /bin/zsh
