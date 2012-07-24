# Contributor: chochem <chochem@gmail.com>

pkgname=rungetty
pkgver=1.2
_pkgver=.orig
pkgrel=2
pkgdesc="rungetty takes command of a virtual console and runs any program on it."
arch=(i686)
url="http://linux.maruhn.com/sec/rungetty.html"
license=('GPL')
depends=(glibc)
makedepends=(glibc)
source=(ftp://ftp.gnome.org/mirror/ubuntu/pool/universe/r/rungetty/${pkgname}_${pkgver}${_pkgver}.tar.gz)
md5sums=('acca2a8a6a06b1474e199c30cf556b9c')

build() {
  cd "$srcdir/$pkgname-$pkgver$_pkgver"
  make
  mv Makefile Makefile.old
  sed -e s/\$\(ROOT\)/pkg/g Makefile.old > Makefile
  make DESTDIR="$pkgdir/" install
  mv pkg $startdir
}
