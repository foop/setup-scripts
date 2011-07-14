#! /bin/bash


scriptDir=$PWD
echo "Enter clojure version or hit enter for 1.2.1"
read version
if [ "$version" == "" ] 
then
  version="1.2.1"
fi

dl="clojure-$version.zip"
url="https://github.com/downloads/clojure/clojure/$dl"

echo "Setting up clojure $version from $url"
sudo mkdir /opt/clojure
cd /opt/clojure
sudo wget "$url"
sudo unzip "$dl"
sudo rm "$dl"
sudo ln -s "/opt/clojure/clojure-$version" /opt/clojure/latest
sudo mkdir "/opt/clojure/clojure-$version/bin"

clojure="/opt/clojure/clojure-$version/bin/clojure"
echo "#! /bin/bash
java -cp /opt/clojure/clojure-$version/clojure.jar clojure.main \$1" | sudo sh -c "cat > $clojure"
sudo chmod a+x $clojure
sudo update-alternatives --install /usr/bin/clojure clojure "/opt/clojure/latest/bin/clojure" 1
sudo update-alternatives --install /usr/bin/clojure clojure "/opt/clojure/clojure-$version/bin/clojure" 2