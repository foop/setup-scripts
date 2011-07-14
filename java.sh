#! /bin/bash


echo "Oracle requires submitting a form to download the jdk. Opening browser..."
xdg-open http://www.oracle.com/technetwork/java/javase/downloads/index.html

echo "Path to installed JDK (JAVA_HOME or JDK_HOME)"
read path 


echo "Setting up jdk"
sudo mkdir /opt/java


sudo ln -s "$path" /opt/java/latest
sudo update-alternatives --install /usr/bin/java java "/opt/java/latest/bin/java" 1
sudo update-alternatives --install /usr/bin/java java "$path/bin/java" 2

sudo update-alternatives --install /usr/bin/javac javac "/opt/java/latest/bin/javac" 1
sudo update-alternatives --install /usr/bin/javac javac "$path/bin/javac" 2

sudo update-alternatives --install /usr/bin/javaws javaws "/opt/java/latest/bin/javaws" 1
sudo update-alternatives --install /usr/bin/javaws javaws "$path/bin/javaws" 2


