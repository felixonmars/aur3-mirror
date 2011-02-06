# maintainer: karabaja4 <karabaja4@archlinux.us>

pkgname=xfwm4-standalone
pkgver=4.6.2
pkgrel=1
pkgdesc="Xfce window manager - standalone version to use with xfdesktop-standalone"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
depends=('xfdesktop-standalone>=4.6.2' 'libxfcegui4>=4.6.4' 'libwnck' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool')
options=('!libtool')
install=xfwm4.install
source=(http://archive.xfce.org/src/xfce/xfwm4/4.6/xfwm4-${pkgver}.tar.bz2)
md5sums=('3e6c0c54b028b6ea60e865e55ecdf3f8')

build() {
  cd ${srcdir}/xfwm4-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --disable-static \
    --enable-compositor --enable-xsync || return 1
  make || return 1
}

package() {
  cd ${srcdir}/xfwm4-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
}
