################################################################
# CL Runtime and Caveman WEB App
################################################################
FROM debian:jessie-backports
# FROM debian:stretch
MAINTAINER keicy-silurus

################################################################
# Common Lisp
# Roswll でなく直に sbcl をaptでも良い気がするが、quicklispとかめんどいか
# まあCLはいずれ離れるだろうし、拘らないで良いと思う
# CL側の問題であってDocker起因ではないし

sudo apt-get -y install git build-essential automake libcurl4-openssl-dev
git clone -b release https://github.com/roswell/roswell.git ~/roswell
cd roswell
sh bootstrap
./configure
make
sudo make install
ros setup
apt-get --purge autoremove 上記ビルド関連ライブラリ群
apt-get clean
rm -rf ~/roswell

################################################################
# App

################################################################
# Uninstall tools
apt-get --purge autoremove git
