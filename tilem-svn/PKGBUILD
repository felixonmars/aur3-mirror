# Maintainer: George Hilliard <gh403 at msstate dot edu>

pkgname=tilem-svn
pkgver=20130227
pkgrel=1
pkgdesc="TI calculator emulator."
arch=(i686 x86_64)
url="http://lpg.ticalc.org/prj_tilem/index.html"
license=(GPL)
depends=('gtk2>=2.4' libticalcs)
makedepends=()
conflicts=('tilem')
install='tilem.install'
source=()
md5sums=()

build() {
  svn checkout https://tilem.svn.sourceforge.net/svnroot/tilem/trunk $pkgname-$pkgver
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr LIBS="-lm"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install prefix="$pkgdir/usr"
  find $pkgdir/usr/share/mime -maxdepth 1 -not -type d -exec rm {} \;
  rm $pkgdir/usr/share/applications/mimeinfo.cache
}

