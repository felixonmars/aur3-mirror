# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=ivysync
pkgver=0.5
pkgrel=1
pkgdesc="Provides synced playback of multiple videos on multiple screens."
arch=(i686 x86_64)
url="http://syncstarter.org/ivysync/"
license=('AGPL')
depends=('gtk2' 'python2')
source=("http://ftp.dyne.org/$pkgname/sources/$pkgname-$pkgver.tar.gz")
md5sums=('43fba34011801fd45d795bb35d557f54')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # adding missing header
  sed -i '21a#include <stdio.h>' decoder.cpp

  # openssl fix
  sed -i 's/\( *\)\(SSL_METHOD\)/\1const \2/' xmlrpc++/XmlRpcSource.h

  # build
  echo 5 | ./compile.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # bin
  install -d "$pkgdir/usr/bin"
  find . -type f -executable \! -name "*.sh" -exec \
  install -Dm755 {} "$pkgdir/usr/bin" \;

  # doc
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 README *.odt "$pkgdir/usr/share/doc/$pkgname"

  # python2 fix
  sed -i "s/bin\/python/&2/" "$pkgdir/usr/bin/ivysync-remote.py"
}

# vim:set ts=2 sw=2 et:
