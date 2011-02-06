# Contributor: Pavel Borzenkov <pavel.borzenkov@gmail.com"

pkgname=tcludp
pkgver=1.0.8
pkgrel=1
pkgdesc="The Tcl UDP extension provides a simple library to support UDP socket in Tcl."
url="http://tcludp.sourceforge.net"
license="MIT"
depends=('tcl')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=("http://dl.sourceforge.net/sourceforge/tcludp/$pkgname-$pkgver.tar.gz")
md5sums=('60dd3a553fc8e579ecfd6622252da2d2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
