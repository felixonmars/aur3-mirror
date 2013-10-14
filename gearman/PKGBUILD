# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Vadym Abramchuk <abramm@gmail.com>
# Contributor: John Gerritse <reaphsharc@gmail.com>

pkgname=gearman
pkgver=1.1.11
pkgrel=1
pkgdesc="Gearman provides a generic application framework to farm out work to other machines or processes that are better suited to do the work. It allows you to do work in parallel, to load balance processing, and to call functions between languages."
arch=('i686' 'x86_64')
depends=('libevent' 'boost' 'boost-libs' 'gperf')
url="http://gearman.org/"
license=('Simplified BSD License')
install=$pkgname.install
backup=('etc/gearmand.conf')
source=(https://launchpad.net/gearmand/1.2/${pkgver}/+download/gearmand-${pkgver}.tar.gz
        gearman.service
        gearmand.conf)
md5sums=('5048ff0a366f7c37e0abf86d88e7cb9c'
         'd8cc2635d50bb2fdb3f9c7f2e9938098'
         'b4b8d4f8703bd15fd3ca15f6f5fcbe2d')

build() {
  cd "${srcdir}/${pkgname}d-${pkgver}"
  LIBS="-lboost_system" ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --localstatedir=/run
  make CFLAGS+='-std=gnu99 -fPIC' || return 1
}

package() {
  cd "${srcdir}/${pkgname}d-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm644 $srcdir/gearman.service $pkgdir/usr/lib/systemd/system/gearman.service
  install -Dm644 $srcdir/gearmand.conf $pkgdir/etc/gearmand.conf
}
