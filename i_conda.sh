#!/bin/bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/src/miniconda.sh
sh ~/src/miniconda.sh -b -p ~/src/miniconda3/
eval "$(~/src/miniconda3/bin/conda shell.bash hook)"
conda init
