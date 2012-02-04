# Maintainer: twa022 <twa022@gmail.com>

pkgname=libxfce4menu-devel
pkgver=4.6.1
pkgrel=1
pkgdesc="a freedesktop.org compliant menu for Xfce (Development Version)"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4-devel')
depends=('libxfce4util-devel>=${pkgver}')
makedepends=('pkgconfig')
conflicts=('libxfce4menu' 'libxfce4menu-svn')
provides=("libxfce4menu=${pkgver}")
options=('!libtool')
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/libxfce4menu-${pkgver}.tar.bz2)
md5sums=('5dc9343885c2c6f931318b2a1cdcc9db')

build() {
  cd ${srcdir}/libxfce4menu-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${pkgdir} install
}
