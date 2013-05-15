# Maintainer: Dor Shahaf <SoapSeller@gmail.com>

pkgname=sdcc-nf
pkgver=3.3.0
pkgrel=1
pkgdesc="Retargettable ANSI C compiler with non-free targets(avr and xa51)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('bash' 'gcc-libs')
provide=('sdcc')
conflicts=('sdcc')
makedepends=('gputils' 'flex' 'bison' 'patch')
optdepends=('python')
url="http://sdcc.sourceforge.net/"
options=(!strip)
source=(http://downloads.sourceforge.net/sourceforge/sdcc/sdcc-src-$pkgver-rc3.tar.bz2)
md5sums=('a90d9b36283a4adefc5985a07b4efe99')

build() {
  #cd $srcdir/sdcc
  cd $srcdir/sdcc-3.3.0-rc3
  LDFLAGS="-lm" ./configure --prefix=$pkgdir/usr --enable-avr-port --enable-xa51-port
  make
  make install
  strip $pkgdir/usr/bin/* || true
}
