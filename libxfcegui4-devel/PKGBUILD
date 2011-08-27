# Maintainer twa022 <twa022@gmail.com>

pkgname=libxfcegui4-devel
pkgver=4.6.1
pkgrel=1
pkgdesc="Various gtk widgets for Xfce (Development Version)"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4-devel')
depends=('startup-notification' "xfconf-devel>=$pkgver" "libglade>=2.6.3" 'hicolor-icon-theme')
makedepends=('pkgconfig')
conflicts=('libxfcegui4' 'libxfcegui4-svn')
provides=("libxfcegui4=${pkgver}")
options=('!libtool')
install=libxfcegui4.install
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/libxfcegui4-${pkgver}.tar.bz2)
md5sums=('539cff747634b8ee6f0d2362ee78a286')

build() {
  cd ${srcdir}/libxfcegui4-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static # --enable-xinerama
  make || return 1
  make DESTDIR=${pkgdir} install
}
