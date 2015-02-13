sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 40554B8FA5FE6F6A
echo 'deb https://tiliado.eu/nuvolaplayer/repository/deb/ utopic stable' | sudo tee /etc/apt/sources.list.d/nuvola.list
sudo apt-get update
sudo apt-get install nuvolaplayer3
