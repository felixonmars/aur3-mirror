# Maintainer: twa022 <twa022@gmail.com>

pkgname=orage-devel
pkgver=4.6.1
pkgrel=1
pkgdesc="A simple calendar application for Xfce (Development Version)"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/projects/orage/"
depends=("xfce4-panel-devel>=$pkgver" 'libnotify' 'hicolor-icon-theme')
makedepends=('intltool' 'pkgconfig')
options=('!libtool')
replaces=('xfcalendar')
conflicts=('orage')
provides=("orage=${pkgver}")
install=orage.install
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/orage-${pkgver}.tar.bz2)
md5sums=('24fa43dd86ec5af5a4766620fd972cf2')

build() {
  cd ${srcdir}/orage-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
  --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
