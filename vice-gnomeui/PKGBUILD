# Contributor: Jarre Bylove <jarrebylove@gmail.com>
# Maintainer: David Becker <david dot becker at gmx dot org>

pkgname=vice-gnomeui
pkgver=2.3
pkgrel=1
pkgdesc="Vice is old 8-bit computers emulator (C64, C128, VIC20, almost all PET models, PLUS4 and CBM-II)."
makedepends=(pkgconfig)
depends=('audiofile' 'esound' 'ffmpeg')
source=(http://www.zimmers.net/anonftp/pub/cbm/crossplatform/emulators/VICE/vice-${pkgver}.tar.gz
	vice.patch)
md5sums=('b48d137874daad50c087a0686cbdde34'
	 '61ebc7b35f30d4b4ca352d0fc44d22c9')
url="http://www.viceteam.org/"
license=(GPL)
arch=('i686' 'x86_64')

build() {
  cd $startdir/src/vice-${pkgver}
  patch -p1 -i $srcdir/vice.patch
  ./configure --prefix=/usr --enable-gnomeui
  make clean || return 1
  make DESTDIR=$startdir/pkg install
}
