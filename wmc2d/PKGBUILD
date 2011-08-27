# Contributor: wayseeker <putnik.dzen at gmail dot com>

pkgname=wmc2d
pkgver=2.01
pkgrel=1
pkgdesc="This is a small dockapp, which shows the core 2 duo temperature and the temperature of ACPI thermal zone 0, which is normaly the motherboard temperature."
url="http://www.goron.de/~johns/wmc2d"
license="GPL"
depends=('xcb-util')
arch=('i686' 'x86_64')
source=(http://www.goron.de/~johns/wmc2d/wmc2d-2009-04-30-10.tar.bz2)
md5sums=('fce5df9b1f0c81d0cb7ad78435c06e1f')
build() {
  cd ${srcdir}/${pkgname}
  make || return 1
  install -D -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname} || return 1
}
