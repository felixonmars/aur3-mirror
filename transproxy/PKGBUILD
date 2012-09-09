# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=transproxy
pkgver=1.6
pkgrel=1
pkgdesc="Transparent HTTP Proxy."
arch=('i686' 'x86_64')
url="http://transproxy.sourceforge.net/"
license=('custom:NORTHLINK COMMUNICATIONS PTY LTD - BSD Style License')
depends=()
makedepends=()
conflicts=('transproxy')
provides=('transproxy')
source=("http://dfn.dl.sourceforge.net/project/transproxy/transproxy/$pkgver/transproxy-$pkgver.tgz"
        "prefix-patch.patch")
md5sums=(02cc1160a9db9c49a40491f890083044
         63c66ab8cf5dde855b559d061448bf8b)

build() {
	cd "$srcdir/transproxy-$pkgver"
	
	patch -p1 -i "$srcdir/prefix-patch.patch"
	make
}

package() {
	mkdir -p "$pkgdir/usr/sbin"
	mkdir -p "$pkgdir/usr/man/man8"
	
	cd "$srcdir/transproxy-$pkgver"
	
	make PREFIX="$pkgdir/usr" install
}
