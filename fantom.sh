#! /bin/bash


echo "Enter fantom version or hit enter for 1.0.59"
read version
if [ "$version" == "" ] 
then
  version="1.0.59"
fi

dl="fantom-$version.zip"
url="http://fan.googlecode.com/files/$dl"

echo "Setting up fantom $version from $url"
sudo mkdir /opt/fantom
cd /opt/fantom
sudo wget "$url"
sudo unzip "$dl"
sudo rm "$dl"
sudo ln -s "/opt/fantom/fantom-$version" /opt/fantom/latest
sudo chmod -R a+x "/opt/fantom/fantom-$version/bin"

sudo update-alternatives --install /usr/bin/fan fan "/opt/fantom/latest/bin/fan" 1
sudo update-alternatives --install /usr/bin/fan fan "/opt/fantom/fantom-$version/bin/fan" 2

sudo update-alternatives --install /usr/bin/fanlaunch fanlaunch "/opt/fantom/latest/bin/fanlaunch" 1
sudo update-alternatives --install /usr/bin/fanlaunch fanlaunch "/opt/fantom/fantom-$version/bin/fanlaunch" 2


sudo update-alternatives --install /usr/bin/fanp fanp "/opt/fantom/latest/bin/fanp" 1
sudo update-alternatives --install /usr/bin/fanp fanp "/opt/fantom/fantom-$version/bin/fanp" 2

sudo update-alternatives --install /usr/bin/fanr fanr "/opt/fantom/latest/bin/fanr" 1
sudo update-alternatives --install /usr/bin/fanr fanr "/opt/fantom/fantom-$version/bin/fanr" 2

sudo update-alternatives --install /usr/bin/fansh fansh "/opt/fantom/latest/bin/fansh" 1
sudo update-alternatives --install /usr/bin/fansh fansh "/opt/fantom/fantom-$version/bin/fansh" 2

sudo update-alternatives --install /usr/bin/fant fant "/opt/fantom/latest/bin/fant" 1
sudo update-alternatives --install /usr/bin/fant fant "/opt/fantom/fantom-$version/bin/fant" 2

sudo update-alternatives --install /usr/bin/flux flux "/opt/fantom/latest/bin/flux" 1
sudo update-alternatives --install /usr/bin/flux flux "/opt/fantom/fantom-$version/bin/flux" 2

sudo update-alternatives --install /usr/bin/jstub jstub "/opt/fantom/latest/bin/jstub" 1
sudo update-alternatives --install /usr/bin/jstub jstub "/opt/fantom/fantom-$version/bin/jstub" 2

