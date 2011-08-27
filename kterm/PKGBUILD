# Contributor: Alex Suykov <axs@ukr.net>
pkgname=kterm
pkgver=6.2.0
pkgrel=1
pkgdesc="multi-lingual/japanese terminal emulator for X"
arch=('i686')
license=('BSD')
groups=()
url='ftp://ftp.x.org/contrib/applications'
depends=(glibc libx11 libxcb libxau libxdmcp libxaw libxmu libxt libsm libice libxp libxpm libxext ncurses)
makedepends=(gcc make imake)
source=(ftp://ftp.x.org/contrib/applications/$pkgname-$pkgver.tar.gz \
  kterm-devfs-aware.patch \
  kterm-stdlib-fix.patch)
md5sums=('9cc72841b50dfba92bce01dbbebf3039'
         'f2e56872ca25e293e7ea53448b14cbbb'
         'eb997d369695805941b28bba98d13bea')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i ../${source[1]}
  patch -p1 -i ../${source[2]}
  xmkmf || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install install.man
}

# vim:set ts=2 sw=2 et:
