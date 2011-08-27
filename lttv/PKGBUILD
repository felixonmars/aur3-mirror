# Maintainer: Markus Opitz <mastero23 at gmail dot com>

pkgname=lttv
pkgver=0.12.38
_pkgdate=21032011
pkgrel=1
pkgdesc="LTTng graphical trace viewer"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('GPL')
depends=('gtk2' 'ltt-control' 'popt')
#depends=('lttng-modules')
options=(!libtool)
source=(http://lttng.org/files/packages/$pkgname-$pkgver-$_pkgdate.tar.gz)
md5sums=('071bf3dd13e7562c08ee8f8971cfc76d')

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
