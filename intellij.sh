#! /bin/bash


echo "Enter groovy version or hit enter for 10.5.1"
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
mkdir tmp
tar xzf "$dl" -C ./tmp
rm "$dl"
for f in "~/apps/idea/tmp"
do
  case $f in
    idea-IU-[0-9]+\.[0-2])
      mv $f "~/apps/idea/idea-$version"
      ;;
  esac
done

ln -s "~/apps/idea/idea-$version" /apps/idea/latest

sudo update-alternatives --install /usr/bin/idea idea "/apps/idea/latest/bin/idea.sh" 1
sudo update-alternatives --install /usr/bin/idea idea "/apps/idea/idea-$version/bin/idea.sh" 2





