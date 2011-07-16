#! /bin/bash


echo "Enter intellij version or hit enter for 10.5.1"
read version
if [ "$version" == "" ] 
then
  version="10.5.1"
fi

dl="ideaIU-$version.tar.gz"
url="http://download-ln.jetbrains.com/idea/$dl"

echo "Setting up intellij $version from $url"
mkdir ~/apps
mkdir ~/apps/idea
cd /apps/idea
wget "$url"
mkdir ~/apps/idea/tmp
tar xzf "$dl" -C ~/apps/idea/tmp
rm "$dl"
ls ~/apps/idea/tmp
ls ~/apps/idea/tmp | sed -n 's/idea-IU-\([0-9]\{,3\}\.[0-9]\{,3\}\)/mv "&" "~/apps/idea/idea-$version"/p' | sh
rm -Rf ~/apps/idea/tmp
ln -s "~/apps/idea/idea-$version" /apps/idea/latest

sudo update-alternatives --install /usr/bin/idea idea "/apps/idea/latest/bin/idea.sh" 1
sudo update-alternatives --install /usr/bin/idea idea "/apps/idea/idea-$version/bin/idea.sh" 2





