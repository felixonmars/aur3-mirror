# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Philipp Sandhaus <philipp.sandhaus@gmx.de>

pkgname=python2-ktoblzcheck
pkgver=1.39
pkgrel=1
pkgdesc="A library to check account numbers and bank codes of German banks"
arch=(i686 x86_64)
url="http://ktoblzcheck.sourceforge.net"
options=('!libtool')
license=("LGPL")
depends=('gcc-libs' 'python2')
optdepends=('perl')
conflicts=('ktoblzcheck')
replaces=('ktoblzcheck')
provides=('ktoblzcheck')
source=(http://downloads.sourceforge.net/sourceforge/ktoblzcheck/ktoblzcheck-$pkgver.tar.gz)
md5sums=('ef5efd6e2c31aaf6405060ec477c200c')

build() {
  cd "$srcdir/ktoblzcheck-$pkgver"
  PYTHON=/usr/bin/python2 ./configure  --prefix=/usr
  PYTHON=/usr/bin/python2 make
}
package() {
  cd "$srcdir/ktoblzcheck-$pkgver"
   PYTHON=/usr/bin/python2 make DESTDIR="$pkgdir" install
}
