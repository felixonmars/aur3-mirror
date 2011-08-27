# Maintainer: twa022 <twa022@gmail.com>

pkgname=xfwm4-themes-devel
pkgver=4.6.0
pkgrel=1
pkgdesc="Additional themes for XFWM (Development Version)"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4-devel')
depends=("xfwm4-devel>=${pkgver}")
makedepends=('pkgconfig')
options=('!libtool')
conflicts=('xfwm4-themes')
provides=("xfwm4-themes=${pkgver}")
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/xfwm4-themes-${pkgver}.tar.bz2)
md5sums=('4dc5cb29cbd40e3b9dece12a85e20854')

build() {
  cd ${srcdir}/xfwm4-themes-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
