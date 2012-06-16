# Maintainer: Bart Verhoeven <nepherte at archlinux dot us>

pkgname=mercury-compiler-rotd
pkgver=20120613
_rotd=${pkgver:0:4}-${pkgver:4:2}-${pkgver:6:2}
pkgrel=1
pkgdesc="daily snapshot of the mercury language compiler"
arch=('i686' 'x86_64')
url="http://www.mercury.csse.unimelb.edu.au/index.html"
license=('GPL')
depends=('gcc' 'make')
makedepends=('flex' 'bison')
provides=(mercury-compiler)
conflicts=(mercury-compiler)
changelog=$pkgname.changelog
source=(http://www.mercury.cs.mu.oz.au/download/files/beta-releases/rotd/${pkgname}-${_rotd}-unstable.tar.gz)
md5sums=('6eaf9360c55728645612e37d3da9d02f')

build() {
  cd $srcdir/$pkgname-$_rotd

  ./configure --prefix=/usr --mandir=/usr/share/man \
              --infodir=/usr/share/info --disable-debug-grades \
              --disable-inefficient-grades 

  # Uncomment PARALLEL and change -j accordingly to speed  up compilation
  make #PARALLEL="-j2"
}

package() {
  cd $srcdir/$pkgname-$_rotd

  # Uncomment PARALLEL and change -j accordingly to speed  up compilation
  make INSTALL_PREFIX="$pkgdir/usr" INSTALL_MAN_DIR="$pkgdir/usr/share/man" \
       INSTALL_INFO_DIR="$pkgdir/usr/share/info" \
       MERCURY_COMPILER="$pkgdir/usr/bin/mercury_compile" \
       MERCURY_CONFIG_DIR="$pkgdir/usr/lib/mercury" \
       #PARALLEL="-j2" \
       install
}

# vim:set ts=2 sw=2 et:
