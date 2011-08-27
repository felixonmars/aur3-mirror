# Maintainer: Markus Opitz <mastero23 at gmail dot com>

pkgname=ltt-control
pkgver=0.89
_pkgdate=05122011
pkgrel=1
pkgdesc="Miscellaneous utilities for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('GPL')
depends=('lttng-modules')
options=(!libtool)
source=(http://lttng.org/files/lttng/$pkgname-$pkgver-$_pkgdate.tar.gz)
md5sums=('2e5a531bf5cab88eef5282b45271789f')

build() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgdate"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --libexecdir="/usr/lib/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$_pkgdate"
  make DESTDIR="$pkgdir/" install
}
