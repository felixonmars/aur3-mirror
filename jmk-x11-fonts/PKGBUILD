# Maintainer: s4msung <s4msung@exigen.org>
pkgname=jmk-x11-fonts
pkgver=3.0
pkgrel=1
pkgdesc="Jim's fonts for X"
arch=(any)
url="http://www.jmknoble.net/fonts/"
license=('GPL')
depends=("xorg-font-utils" "fontconfig")
makedepends=("imake")
install=jmk-x11-fonts.install
changelog=
source=(ftp://metalab.unc.edu/pub/Linux/X11/fonts/$pkgname-$pkgver.tar.gz)
md5sums=('1c699d69c02a306b9148d9148b6dace2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  xmkmf
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
