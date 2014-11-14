# Contributor: Sofia Benitez <srita.sapphire at gmail dot com>
# Contributor: delta48 <dark.magician.48[at]gmail[dot]com>

pkgname="debian-netcat"
pkgver="1.10"
pkgrel=1
pkgdesc="TCP/IP swiss army knife. Debian variant."
arch=('i686' 'x86_64')
provides=("netcat")
url="https://packages.debian.org/source/sid/netcat"
license=('custom')
source=("http://ftp.de.debian.org/debian/pool/main/n/netcat/netcat_$pkgver.orig.tar.bz2"
"http://ftp.de.debian.org/debian/pool/main/n/netcat/netcat_$pkgver-41.debian.tar.xz")
md5sums=('7dc5c7450e708796395ffd746c197234'
         '5a16ff7274dd1d3a4002d2e51d5dca89')

prepare () {
       	cat debian/patches/series | xargs  -n1 patch -p1
	# add missing header
       	sed -i -e  '75 a#include <resolv.h>' "$srcdir/netcat-$pkgver.orig/netcat.c"
}

build () {
	cd $srcdir/netcat-$pkgver.orig
	make linux
}

package () {
	install -D -m755 $srcdir/netcat-$pkgver.orig/nc $pkgdir/usr/bin/nc
      	install -D -m644 debian/man/nc.1 $pkgdir/usr/share/man/man1/nc.1
}
