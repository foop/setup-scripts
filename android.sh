#! /bin/bash


echo "Enter android-sdk version or hit enter for r15"
read version
if [ "$version" == "" ] 
then
  version="r15"
fi

dl="android-sdk_$version-linux.tgz"
url="http://dl.google.com/android/$dl"

echo "Get 64 bit dependencies? [Y/N] Y:"
read get64BitDep
if [ "$get64BitDep" != "N" ]
then
  echo "Getting (64 bit) dependencies"
  sudo apt-get install ia32-libs
fi

echo "Setting up android sdk $version from $url"
sudo mkdir /opt/android
sudo mkdir "/opt/android/sdk-$version"
cd /opt/android
sudo wget "$url"
sudo tar xzf "$dl" -C "/opt/android/sdk-$version"
sudo rm "$dl"
sudo ln -s "/opt/android/sdk-$version/android-sdk-linux" /opt/android/latest

sudo chown -R $USER "/opt/android/sdk-$version"

sudo update-alternatives --install /usr/bin/android android "/opt/android/latest/tools/android" 1
sudo update-alternatives --install /usr/bin/android android "/opt/android/sdk-$version/android-sdk-linux/tools/android" 2

sudo update-alternatives --install /usr/bin/apkbuilder apkbuilder "/opt/android/latest/tools/apkbuilder" 1
sudo update-alternatives --install /usr/bin/apkbuilder apkbuilder "/opt/android/sdk-$version/android-sdk-linux/tools/apkbuilder" 2

sudo update-alternatives --install /usr/bin/ddms ddms "/opt/android/latest/tools/ddms" 1
sudo update-alternatives --install /usr/bin/ddms ddms "/opt/android/sdk-$version/android-sdk-linux/tools/ddms" 2

sudo update-alternatives --install /usr/bin/dmtracedump dmtracedump "/opt/android/latest/tools/dmtracedump" 1
sudo update-alternatives --install /usr/bin/dmtracedump dmtracedump "/opt/android/sdk-$version/android-sdk-linux/tools/dmtracedump" 2

sudo update-alternatives --install /usr/bin/draw9patch draw9patch "/opt/android/latest/tools/draw9patch" 1
sudo update-alternatives --install /usr/bin/draw9patch draw9patch "/opt/android/sdk-$version/android-sdk-linux/tools/draw9patch" 2

sudo update-alternatives --install /usr/bin/emulator emulator "/opt/android/latest/tools/emulator" 1
sudo update-alternatives --install /usr/bin/emulator emulator "/opt/android/sdk-$version/android-sdk-linux/tools/emulator" 2

sudo update-alternatives --install /usr/bin/emulator-arm emulator-arm "/opt/android/latest/tools/emulator-arm" 1
sudo update-alternatives --install /usr/bin/emulator-arm emulator-arm "/opt/android/sdk-$version/android-sdk-linux/tools/emulator-arm" 2

sudo update-alternatives --install /usr/bin/emulator-x86 emulator-x86 "/opt/android/latest/tools/emulator-x86" 1
sudo update-alternatives --install /usr/bin/emulator-x86 emulator-x86 "/opt/android/sdk-$version/android-sdk-linux/tools/emulator-x86" 2

sudo update-alternatives --install /usr/bin/etc1tool etc1tool "/opt/android/latest/tools/etc1tool" 1
sudo update-alternatives --install /usr/bin/etc1tool etc1tool "/opt/android/sdk-$version/android-sdk-linux/tools/etc1tool" 2

sudo update-alternatives --install /usr/bin/hierarchyviewer hierarchyviewer "/opt/android/latest/tools/hierarchyviewer" 1
sudo update-alternatives --install /usr/bin/hierarchyviewer hierarchyviewer "/opt/android/sdk-$version/android-sdk-linux/tools/hierarchyviewer" 2

sudo update-alternatives --install /usr/bin/hprof-conv hprof-conv "/opt/android/latest/tools/hprof-conv" 1
sudo update-alternatives --install /usr/bin/hprof-conv hprof-conv "/opt/android/sdk-$version/android-sdk-linux/tools/hprof-conv" 2

sudo update-alternatives --install /usr/bin/layoutopt layoutopt "/opt/android/latest/tools/layoutopt" 1
sudo update-alternatives --install /usr/bin/layoutopt layoutopt "/opt/android/sdk-$version/android-sdk-linux/tools/layoutopt" 2

sudo update-alternatives --install /usr/bin/mksdcard mksdcard "/opt/android/latest/tools/mksdcard" 1
sudo update-alternatives --install /usr/bin/mksdcard mksdcard "/opt/android/sdk-$version/android-sdk-linux/tools/mksdcard" 2

sudo update-alternatives --install /usr/bin/monkeyrunner monkeyrunner "/opt/android/latest/tools/monkeyrunner" 1
sudo update-alternatives --install /usr/bin/monkeyrunner monkeyrunner "/opt/android/sdk-$version/android-sdk-linux/tools/monkeyrunner" 2

sudo update-alternatives --install /usr/bin/sqlite3 sqlite3 "/opt/android/latest/tools/sqlite3" 1
sudo update-alternatives --install /usr/bin/sqlite3 sqlite3 "/opt/android/sdk-$version/android-sdk-linux/tools/sqlite3" 2

sudo update-alternatives --install /usr/bin/traceview traceview "/opt/android/latest/tools/traceview" 1
sudo update-alternatives --install /usr/bin/traceview traceview "/opt/android/sdk-$version/android-sdk-linux/tools/traceview" 2

sudo update-alternatives --install /usr/bin/zipalign zipalign "/opt/android/latest/tools/zipalign" 1
sudo update-alternatives --install /usr/bin/zipalign zipalign "/opt/android/sdk-$version/android-sdk-linux/tools/zipalign" 2


echo "Update sdk? (this takes a while) [Y/N] Y:"
read updateSdk
if [ "$updateSdk" != "N" ]
then
  android update sdk -u
  echo "Android sdk updated"

  sudo update-alternatives --install /usr/bin/adb adb "/opt/android/latest/platform-tools/adb" 1
  sudo update-alternatives --install /usr/bin/adb adb "/opt/android/sdk-$version/android-sdk-linux/platform-tools/adb" 2

  sudo update-alternatives --install /usr/bin/aapt aapt "/opt/android/latest/platform-tools/aapt" 1
  sudo update-alternatives --install /usr/bin/aapt aapt "/opt/android/sdk-$version/android-sdk-linux/platform-tools/aapt" 2

  sudo update-alternatives --install /usr/bin/aidl aidl "/opt/android/latest/platform-tools/aidl" 1
  sudo update-alternatives --install /usr/bin/aidl aidl "/opt/android/sdk-$version/android-sdk-linux/platform-tools/aidl" 2

  sudo update-alternatives --install /usr/bin/dexdump dexdump "/opt/android/latest/platform-tools/dexdump" 1
  sudo update-alternatives --install /usr/bin/dexdump dexdump "/opt/android/sdk-$version/android-sdk-linux/platform-tools/dexdump" 2

  sudo update-alternatives --install /usr/bin/dx dx "/opt/android/latest/platform-tools/dx" 1
  sudo update-alternatives --install /usr/bin/dx dx "/opt/android/sdk-$version/android-sdk-linux/platform-tools/dx" 2

  sudo update-alternatives --install /usr/bin/llvm-rs-cc llvm-rs-cc "/opt/android/latest/platform-tools/llvm-rs-cc" 1
  sudo update-alternatives --install /usr/bin/llvm-rs-cc llvm-rs-cc "/opt/android/sdk-$version/android-sdk-linux/platform-tools/llvm-rs-cc" 2


fi


