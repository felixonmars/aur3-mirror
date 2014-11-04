# Maintainer: Eijebong <eijebong [at] bananium [dot] fr>
# Contributor: Benjamin Abendroth <braph93@gmx.de>

pkgname=proxy-connect
pkgver=1.104
pkgrel=1
pkgdesc="simple relaying command via proxy"
arch=(i686 x86_64)
url="https://bitbucket.org/gotoh/connect"
license=('GPL')
depends=('glibc')
source=(https://bitbucket.org/gotoh/connect/get/${pkgver}.tar.bz2)
md5sums=('b6ac2e50a64d9ba73b0b880213836965')

build() {
	cd $srcdir/gotoh-connect-*
	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/gotoh-connect-*/connect $pkgdir/usr/bin
}

