#!/bin/sh


echo "Enter scala version or hit enter for 2.10.1"
read version
if [ -z "$version" ] 
then
  version="2.10.1"
fi
dl="scala-$version.tgz"
url="http://www.scala-lang.org/downloads/distrib/files/$dl"

echo "Setting up scala $version from $url"
sudo mkdir -p /opt/scala
cd /opt/scala
sudo wget "$url"
sudo tar xzf "$dl"
sudo rm "$dl"
sudo ln -s "/opt/scala/scala-$version" /opt/scala/latest


sudo update-alternatives --install /usr/bin/scala scala "/opt/scala/latest/bin/scala" 1
sudo update-alternatives --install /usr/bin/scala scala "/opt/scala/scala-$version/bin/scala" 2

sudo update-alternatives --install /usr/bin/scalac scalac "/opt/scala/latest/bin/scalac" 1
sudo update-alternatives --install /usr/bin/scalac scalac "/opt/scala/scala-$version/bin/scalac" 2

sudo update-alternatives --install /usr/bin/fsc fsc "/opt/scala/latest/bin/fsc" 1
sudo update-alternatives --install /usr/bin/fsc fsc "/opt/scala/scala-$version/bin/fsc" 2

sudo update-alternatives --install /usr/bin/scalap scalap "/opt/scala/latest/bin/scalap" 1
sudo update-alternatives --install /usr/bin/scalap scalap "/opt/scala/scala-$version/bin/scalap" 2

sudo update-alternatives --install /usr/bin/scaladoc scaladoc "/opt/scala/latest/bin/scaladoc" 1
sudo update-alternatives --install /usr/bin/scaladoc scaladoc "/opt/scala/scala-$version/bin/scaladoc" 2

