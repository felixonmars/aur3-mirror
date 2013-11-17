# Maintainer: Yaron de Leeuw <jdlmail at gmail >

pkgname="gcutil"
pkgver="1.11.0"
pkgrel="1"
pkgdesc="A command-line tool to manage Google Compute Engine resources"
url="https://developers.google.com/compute/docs/gcutil/"
license=("Apache")
arch=("any")
source=(https://google-compute-engine-tools.googlecode.com/files/$pkgname-$pkgver.tar.gz)
depends=('python2')
sha1sums=('bb68d4bd34731361e6b99f015546016b5d34bf13')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's;/usr/bin/env python$;/usr/bin/env python2;' gcutil
  # there are many other refs to python in shebang lines.
  make DESTDIR="$pkgdir" install
}
