#! /bin/bash


echo "Enter groovy version or hit enter for 1.8.0"
read version
if [ "$version" == "" ] 
then
  version="1.8.0"
fi

dl="groovy-binary-$version.zip"
url="http://dist.groovy.codehaus.org/distributions/$dl"

echo "Setting up groovy $version from $url"
sudo mkdir /opt/groovy
cd /opt/groovy
sudo wget "$url"
sudo unzip "$dl"
sudo rm "$dl"
sudo ln -s "/opt/groovy/groovy-$version" /opt/groovy/latest

sudo update-alternatives --install /usr/bin/groovy groovy "/opt/groovy/latest/bin/groovy" 1
sudo update-alternatives --install /usr/bin/groovy groovy "/opt/groovy/groovy-$version/bin/groovy" 2

sudo update-alternatives --install /usr/bin/groovyc groovyc "/opt/groovy/latest/bin/groovyc" 1
sudo update-alternatives --install /usr/bin/groovyc groovyc "/opt/groovy/groovy-$version/bin/groovyc" 2

sudo update-alternatives --install /usr/bin/grape grape "/opt/groovy/latest/bin/grape" 1
sudo update-alternatives --install /usr/bin/grape grape "/opt/groovy/groovy-$version/bin/grape" 2

sudo update-alternatives --install /usr/bin/groovyConsole groovyConsole "/opt/groovy/latest/bin/groovyConsole" 1
sudo update-alternatives --install /usr/bin/groovyConsole groovyConsole "/opt/groovy/groovy-$version/bin/groovyConsole" 2

sudo update-alternatives --install /usr/bin/groovysh groovysh "/opt/groovy/latest/bin/groovysh" 1
sudo update-alternatives --install /usr/bin/groovysh groovysh "/opt/groovy/groovy-$version/bin/groovysh" 2

sudo update-alternatives --install /usr/bin/java2groovy java2groovy "/opt/groovy/latest/bin/java2groovy" 1
sudo update-alternatives --install /usr/bin/java2groovy java2groovy "/opt/groovy/groovy-$version/bin/java2groovy" 2






