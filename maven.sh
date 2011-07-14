#! /bin/bash


defaultVersion="3.0.3"
echo "Enter maven version or hit enter for $defaultVersion"
read version
if [ "$version" == "" ] 
then
  version=$defaultVersion
fi

dl="apache-maven-$version-bin.tar.gz"
url="http://mirrors.axint.net/apache//maven/binaries/$dl"

echo "Setting up maven $version from $url"
sudo mkdir /opt/maven
cd /opt/maven
sudo wget "$url"
sudo tar xzf "$dl"
sudo rm "$dl"
sudo ln -s "/opt/maven/apache-maven-$version" /opt/maven/latest

sudo update-alternatives --install /usr/bin/mvn mvn "/opt/maven/latest/bin/mvn" 1
sudo update-alternatives --install /usr/bin/mvn mvn "/opt/maven/apache-maven-$version/bin/mvn" 2
