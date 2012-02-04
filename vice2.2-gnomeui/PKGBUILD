# Contributor: Felix Michel <felix_michel@gmx.ch>, adopted version from Jarre Bylove

pkgname=vice2.2-gnomeui
pkgver=2.2
pkgrel=1
pkgdesc="Vice is an old 8-bit computer emulator (C64, C128, VIC20, almost all PET models, PLUS4 and CBM-II)."
makedepends=(pkgconfig)
source=(http://www.zimmers.net/anonftp/pub/cbm/crossplatform/emulators/VICE/vice-${pkgver}.tar.gz)
md5sums=('6737f540806205384e9129026898b0a1')
url="http://www.viceteam.org/"
license=(GPL)
arch=('i686' 'x86_64')

build() {
  cd $startdir/src/vice-${pkgver}
  ./configure --prefix=/usr --enable-gnomeui
  make || return 1
  make DESTDIR=$startdir/pkg install
}
