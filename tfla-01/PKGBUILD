# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel
pkgname=tfla-01
pkgver=0.5.0
pkgrel=2
pkgdesc="Logic Analyzer for the Parallel port"
url="http://tfla-01.berlios.de"
license="GPL"
depends=(qt4)
arch=(i686 x86_64)
source=(http://download.berlios.de/tfla-01/tfla-01-$pkgver.tar.bz2)
changelog=$pkgname.changelog
sha256sums=('b091e15d1ddc979a26d565b9d65e510c2364a2d4ac257954103e82a83dc40d2e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_SKIP_RPATH=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
  make DESTDIR=$pkgdir install
}
