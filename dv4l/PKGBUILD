# Contributor: Artiom Molchanov <ar.molchanov@gmail.com>
pkgname=dv4l
pkgver=1.0
pkgrel=3
pkgdesc="This program allows applications using the V4L API to receive video from a firewire camcorder."
url="http://www.lavrsen.dk/twiki/bin/view/Motion/Dv4Linux"
depends=('vloopback' 'libdv>=1.0' 'libraw1394>=1.2' 'libiec61883>=1.1.0' 
'kernel26<2.6.35' )
conflicts=()
license=('GPL')
arch=('i686 x86_64')
#install=$pkgname.install
source=(http://download.berlios.de/dv4l/$pkgname-$pkgver.tar.gz 
makefile.patch header.patch)
md5sums=('4f08a63663137fe3ded838380230ef62'
         '6c7ded38c5be0a29a7b7c806d1f565e9'
         'a40a6c3e74fcfa310485851e97d580e7')
build() {
	cd "$startdir/src/$pkgname-$pkgver"
	patch -p0 < "$startdir/makefile.patch"
	./configure --prefix=/usr
	patch -p0 < "$startdir/header.patch"
	  make || return 1
	  make DESTDIR="$startdir/pkg" install
}
