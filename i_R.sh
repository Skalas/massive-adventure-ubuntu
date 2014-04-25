sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
###################### OJO #################### 
##### Si se cambia la versión de ubuntu hay que cambiar esta línea.
#####################################################
sudo chmod ugo+rw /etc/apt/sources.list
echo 'deb http://cran.r-project.org/bin/linux/ubuntu saucy/' >> '/etc/apt/sources.list'
apt-get update
echo 'y' | sudo apt-get install r-base r-base-dev
