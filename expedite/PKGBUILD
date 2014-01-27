# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=expedite
pkgver=1.7.10
pkgrel=1
pkgdesc="Performance and correctness test suite for Evas (EFL)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl')
optdepends=("python2: Compare Expedite outputs")
source=("http://download.enlightenment.org/releases/$pkgname-$pkgver.tar.bz2")
sha256sums=('91d0290ba3635a4440c389647643beaa8e39def2789d685d54a58a723398cc10')

prepare() {
# set python scripts to run with python2
  sed -i 's/env python$/&2/' "$srcdir/$pkgname-$pkgver/src/bin/expedite-cmp"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./configure \
    --prefix=/usr

  make
}

package(){
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 COPYING-PLAIN "$pkgdir/usr/share/licenses/$pkgname/COPYING-PLAIN"
}
