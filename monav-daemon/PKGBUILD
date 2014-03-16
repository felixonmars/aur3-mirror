# Maintainer: Alex Merry
pkgname=monav-daemon
pkgver=0.3
pkgrel=1
pkgdesc="A background process for calculating geographical routes"
arch=('i686' 'x86_64')
url="https://code.google.com/p/monav"
license=('GPL3')
depends=('qt4')
source=(https://monav.googlecode.com/files/monav-$pkgver.tar.gz)
md5sums=('d048ccef8c6a21e8656aa4af3fcb8329')

prepare() {
	cd "$srcdir/monav-$pkgver"
	sed -i -e '/QT -= gui/d' routingdaemon/routingdaemon.pro
}

build() {
	cd "$srcdir/monav-$pkgver"
	qmake-qt4 monavroutingdaemon.pro
	make
}

package() {
	cd "$srcdir/monav-$pkgver"
	install -d -m755 "$pkgdir/usr/bin"
	install -m755 bin/monav-daemon "$pkgdir/usr/bin"
}
