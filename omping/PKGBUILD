
# Maintainer: Jijun Liu <jijunlx@gmail.comm>
pkgname=omping
pkgver=0.0.4
pkgrel=1
epoch=
pkgdesc="Open Multicast Ping is a tool to test IP multicast functionality primarily in local network"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/omping"
license=('custom')
makedepends=('gcc>4.0.0' 'make')
depends=('glibc')
source=(https://fedorahosted.org/releases/o/m/${pkgname}/${pkgname}-${pkgver}.tar.gz)

md5sums=('ab17ba458ac942e7295dd95496ae90f4')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX=/usr/
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir/" install
    msg2 "Install the omping ..."
    install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
    install -Dm755 omping $pkgdir/usr/bin/
}
