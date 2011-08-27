# Maintainer: Errol Byrd <errolbyrd at gmail dot com>

pkgname=con
pkgver=0.3
pkgrel=3
url="http://errolbyrd.110mb.com/"
pkgdesc="Simple SSH connection manager."
arch=('any')
license=('GPL3')
depends=('openssh' 'awk')
source=('con.sh')
md5sums=('a154ce9c6fcf291001c681405000f53d')
 
build() {
	mkdir -p $pkgdir/usr/bin
	install -m0755 $srcdir/con.sh $pkgdir/usr/bin/con
}

