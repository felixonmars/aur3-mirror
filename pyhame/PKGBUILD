# Maintainer: Geoffrey Lehée <socketubs@gmail.com>
# Contributor: Geoffrey Lehée <socketubs@gmail.com>
pkgname=pyhame
pkgver=0.8.0
pkgrel=1
pkgdesc="Pyhame is an easy website creator written in Python. "
arch=(any)
url="http://pyhame.socketubs.net"
license=('BSD')
depends=('python' 'python3-jinja2')
conflicts=('pyhame-git')
replaces=('pyhame-git')
install=(info.install)
source=(http://redmine.socketubs.net/attachments/download/5/$pkgname-$pkgver-$pkgrel.tar.gz)
md5sums=('c09d697f5f5eaf54b3d1b9939d4b67cd')

build() {
	cd $srcdir/$pkgname
	mkdir -p $pkgdir/usr/lib/$pkgname
	mkdir -p $pkgdir/usr/bin
	cp -R pyhame.py resources $pkgdir/usr/lib/$pkgname
	echo -e '#!/bin/sh \nexec /usr/lib/pyhame/pyhame.py $1' > $pkgdir/usr/bin/$pkgname
	chmod +x $pkgdir/usr/bin/$pkgname
}
