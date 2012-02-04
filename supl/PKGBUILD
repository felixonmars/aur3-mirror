# Maintainer: Dan McGee <dan@archlinux.org>
pkgname=supl
pkgver=1.0.6
pkgrel=1
pkgdesc="Retrieve A-GPS data (ephemeris and almanac) from SUPL servers over TCP/IP"
arch=('i686' 'x86_64')
url="http://www.tajuma.com/supl/index.html"
license=('BSD')
depends=('openssl')
source=(http://downloads.sourceforge.net/project/supl/supl_$pkgver.tar.gz)
md5sums=('72ead03a19fee6ea6ca77577a7ca98dc')
sha256sums=('068dc47ce818ce5634f09a88159df85a6ce3456e2467b11b8c5f8543a99bb347')

build() {
  cd "$srcdir/trunk"
  ./configure --prefix=/usr --precompiled-asn1
  # Fixes linker errors due to missing -lcrypto
  sed -i -e 's#-lssl#$(shell pkg-config --libs openssl)#' src/Makefile
  make
}

package() {
  cd "$srcdir/trunk"
  make DEB_PREFIX="$pkgdir/" install
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
