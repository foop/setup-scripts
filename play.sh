#!/bin/sh


defaultVersion="2.1.0"
echo "Enter play version or hit enter for $defaultVersion"
read version
if [ -z "$version" ] 
then
  version=$defaultVersion
fi

dl="play-$version.zip"
url="http://downloads.typesafe.com/play/$version/$version.zip"

echo "Setting up maven $version from $url"
sudo mkdir -p /opt/play
cd /opt/play
sudo wget "$url"
sudo unzip "$dl"
sudo rm "$dl"
sudo ln -s "/opt/play/play-$version" /opt/play/latest

sudo update-alternatives --install /usr/bin/play play "/opt/maven/latest/play" 1
sudo update-alternatives --install /usr/bin/play play "/opt/play/play-$version/play" 2
