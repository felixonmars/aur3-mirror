# Contributor: SaThaRiel <sathariel74[at]gmail[dot]com>
pkgname=posband
pkgver=0.9.9a1
pkgrel=3
pkgdesc="Angband variant based on NPPAngband with the possibility to play many classes including monsters"
arch=('i686' 'x86_64')
url="http://posband.psd-solutions.com/"
depends=('ncurses' 'lesstif')
makedepends=('ncurses')
license=('custom')
source=(http://posband.psd-solutions.com/downloads/src/posband-0.9.9a1-src.zip)

md5sums=('2a0e70cfcdf6ba69d244d83783fb003c')

build() {
  cd "$srcdir/$pkgname"
  make clean
  ./configure --prefix=/usr --bindir=/usr/bin --with-setgid=games \
          --with-libpath=/usr/lib/posband/
  make
  DESTDIR=$pkgdir/ make install || return 1
}
