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
cd ~/apps/idea
wget "$url"
mkdir ~/apps/idea/tmp
tar xzf "$dl" -C ~/apps/idea/tmp
rm "$dl"
dir=~/apps/idea/tmp
for f in `find $dir -name 'idea-IU-*'`
do
  target=`echo $f | sed 's/idea-IU-\(.*\)/idea-/'`$version
  mv $f $target
  mv $target ~/apps/idea
done
rm -Rf ~/apps/idea/tmp/
ln -s "/home/$USER/apps/idea/idea-$version" /home/$USER/apps/idea/latest

sudo update-alternatives --install /usr/bin/idea idea "/home/$USER/apps/idea/latest/bin/idea.sh" 1
sudo update-alternatives --install /usr/bin/idea idea "/home/$USER/apps/idea/idea-$version/bin/idea.sh" 2





