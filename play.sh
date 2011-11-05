#! /bin/bash


defaultVersion="1.2.2"
echo "Enter play version or hit enter for $defaultVersion"
read version
if [ "$version" == "" ] 
then
  version=$defaultVersion
fi

dl="play-$version.zip"
url="http://download.playframework.org/releases/$dl"

echo "Setting up maven $version from $url"
sudo mkdir /opt/play
cd /opt/play
sudo wget "$url"
sudo unzip "$dl"
sudo rm "$dl"
sudo ln -s "/opt/play/play-$version" /opt/play/latest

sudo update-alternatives --install /usr/bin/play play "/opt/maven/latest/play" 1
sudo update-alternatives --install /usr/bin/play play "/opt/play/play-$version/play" 2
