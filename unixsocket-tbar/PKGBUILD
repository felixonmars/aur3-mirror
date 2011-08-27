# Maintainer:  Marc ' Bomba ' Schulte <bomba@nerdstube.de>

pkgname=unixsocket-tbar
_pkgname=unixsocket
pkgver=0.1
pkgrel=1
pkgdesc="Dependency of Tbar"
url="http://siyb.mount.at/tbar/"
arch=('any')
license=('GPL3')
depends=()
makedepends=('tcl')
optdepends=()
provides=()
conflicts=()
source=("http://siyb.mount.at/tbar/releases/unixsocket_tbar_$pkgver.tar.gz")
md5sums=('976ff7c2dc4390677e6d105539dc667e')

build() {

 cd "$srcdir/unixsocket_tbar_$pkgver"
 
 autoconf || return 1
 ./configure || return 1
 make || return 1
 make DESTDIR="$pkgdir/" install || return 1
}
