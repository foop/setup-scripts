#!/bin/sh


defaultVersion="2.1.0"
echo "Enter play version or hit enter for $defaultVersion"
read version
if [ -z "$version" ] 
then
  version=$defaultVersion
fi

dl="play-$version.zip"
url="http://downloads.typesafe.com/play/$version/play-$version.zip"

echo "Setting up play $version from $url"
mkdir -p "$HOME/opt/play"
cd "$HOME/opt/play"
sudo wget "$url"
sudo unzip "$dl"
sudo rm "$dl"
