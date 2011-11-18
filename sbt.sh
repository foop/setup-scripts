#! /bin/bash


echo "Enter sbt version or hit enter for 0.11.1"
read version
if [ "$version" == "" ]
then
  version="0.11.1"
fi
dl="sbt-launch.jar"
url="http://typesafe.artifactoryonline.com/typesafe/ivy-releases/org.scala-tools.sbt/sbt-launch/$version/$dl"

echo "Setting up sbt $version from $url"
sudo mkdir /opt/sbt
cd /opt/sbt
sudo wget "$url"

echo "#! /bin/bash
java -Xmx512M -jar /opt/sbt/sbt-launch.jar $@" | sudo sh -c "cat > /opt/sbt/sbt"
sudo chmod a+x /opt/sbt/sbt


sudo update-alternatives --install /usr/bin/sbt sbt "/opt/sbt/sbt" 1
