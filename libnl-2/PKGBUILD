pkgname=libnl-2
pkgver=2.0
pkgrel=2
pkgdesc="Library for applications dealing with netlink sockets"
arch=('i686' 'x86_64')
url="http://www.infradead.org/~tgr/libnl/"
license=('GPL')
depends=('glibc')
source=(http://www.infradead.org/~tgr/libnl/files/libnl-${pkgver}.tar.gz)
md5sums=('6aaf1e9802a17a7d702bb0638044ffa7')

build() {
  cd ${srcdir}/libnl-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
}

package() {
  cd ${srcdir}/libnl-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
  # cli headers aren't installed by default.
  cp -a include/netlink/cli "$pkgdir/usr/include/netlink/cli"
}
