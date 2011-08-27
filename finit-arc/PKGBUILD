# Maintainer: Adriano Foschi <adriano.src@gmail.com>
pkgname=finit-arc
pkgver=0.2
pkgrel=3
pkgdesc="Fastinit reimplementation adapted for ArchLinux"
url="http://www.obliquo.net"
arch=('i686' 'x86_64')
license=('GPL2')
install=finit-arc.install
source=(
README
helpers.c
Makefile
README.archlinux
finit-arc.c
helpers.h
start-services.sh
stop-services.sh
finittab
Changelog)
		 
build() {
cd $startdir/src
make || return 1
mkdir -p $startdir/pkg/etc
mkdir -p $startdir/pkg/sbin
mkdir -p $startdir/pkg/usr/sbin
install -m0755 finit-arc $startdir/pkg/sbin/
install -m0755 finittab $startdir/pkg/etc/
install -m0755 start-services.sh $startdir/pkg/usr/sbin/
install -m0755 stop-services.sh $startdir/pkg/usr/sbin/
}
md5sums=('d496d5fff2ec05a7bf9dea4bd51e3771'
         'a33a2d8bfad7295fe35747676cfb7b9d'
         'ae63e970e960f8588c865c2c46346210'
         'a970062d8115b0ef1dd7299ccd1e74a6'
         '7b4bbc67a40d73c540b5776605f5510d'
         '794463ce1069f2ba09ec3c9f71daefb4'
         'b44ecfb5c04aef0e257d130570fbec79'
         '11f9132b2d3cf082cf21e0cd85fc48de'
         '9f9ef4f429dbb64a7fcb97972a6a3f1b'
         '1467fdf864a22803e47e7438fe220928')
