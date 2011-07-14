#! /bin/bash


echo "Enter gosu version or hit enter for 0.8.6.1-C"
read version
if [ "$version" == "" ] 
then
  version="0.8.6.1-C"
fi

dl="gosu-$version.tgz"
url="http://gosu-lang.org/downloads/gosu-$version/$dl"

echo "Setting up gosu $version from $url"
sudo mkdir /opt/gosu
cd /opt/gosu
sudo wget "$url"
sudo tar xzf "$dl"
sudo rm "$dl"
sudo ln -s "/opt/gosu/gosu-$version" /opt/gosu/latest

sudo update-alternatives --install /usr/bin/gosu gosu "/opt/gosu/latest/bin/gosu" 1
sudo update-alternatives --install /usr/bin/gosu gosu "/opt/gosu/gosu-$version/bin/gosu" 2
