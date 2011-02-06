# Contributor: raubkopierer <mail[dot]sensenmann[at]gmail[dot]com>

pkgname=nssl
pkgver=005
pkgrel=3
pkgdesc="is intended to be a netcat-like program with SSL support (both clear and encrypted sessions can be used)"
url="http://sourceforge.net/projects/nssl/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('openssl')
source=(http://downloads.sourceforge.net/project/nssl/nssl/$pkgver/nssl.$pkgver.tgz)
md5sums=('0c29d530d419d9895b5474636b91051f')

build() {
	cd $startdir/src/$pkgname
        make
	mkdir $startdir/pkg/usr
	mkdir $startdir/pkg/usr/bin
	mv $startdir/src/$pkgname/nssl $startdir/pkg/usr/bin
}
