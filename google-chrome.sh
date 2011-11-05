#! /bin/bash

defaultChannel="stable"
echo "Choose a channel [dev,beta,stable] default stable"
read channel
url="https://dl-ssl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

case "$channel" in
  "stable") 
      url="https://dl-ssl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
      ;;
   "beta")
      url="http://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb"
      ;;
    "dev")
      url="http://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb"
      ;;
esac
echo "Downloading google-chrome $channel channel from $url"
wget $url
debFile=${url##*/}
echo "Installing $debFile"
sudo apt-get install libnspr4-0d libcurl3
sudo dpkg -i $debFile
rm $debFile