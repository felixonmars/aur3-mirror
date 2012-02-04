# Contributor: Neil Isaac <isaac dot neil at gmail dot com>
pkgname=fusepod
pkgver=0.5.2
pkgrel=2
pkgdesc="FUSE client for the Apple iPod"
arch=( 'i686' 'x86_64' )
url="http://fusepod.sourceforge.net/"
license=( 'GPL' )
depends=( 'fuse' 'taglib' 'libgpod' )
source=( "http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2" )
md5sums=( '35347e87ad01b17990ff2be6f9d696cd' )
build() {
cd "$srcdir/$pkgname-$pkgver"
printf "17a18\n> #include <cstdio>\n" | patch src/fusepod_util.cpp
printf "19a20\n> #include <strings.h>\n" | patch src/fusepod_util.h
./configure --prefix=/usr || return 1
make || return 1
make DESTDIR="$pkgdir" install || return 1
}
