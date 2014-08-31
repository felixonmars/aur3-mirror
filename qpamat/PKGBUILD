# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: x11
pkgname=qpamat
pkgver=0.5.4
pkgrel=3
pkgdesc="Password manager in Qt"
url="http://qpamat.berlios.de"
license="GPL"
depends=(qt4)
arch=(i686 x86_64)
source=("https://bitbucket.org/bwalle/qpamat/downloads/qpamat-$pkgver.tar.bz2")
sha256sums=('f22362b207353aa6745d3a31b45a22b84b08a4ae4989e8bd119a02695b36af68')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  [ ! -d build ] && mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package()
{
  cd "$srcdir/$pkgname-$pkgver/build"
  make "DESTDIR=$pkgdir" install
}
