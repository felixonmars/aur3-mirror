# Contributor: karabaja4 <karabaja4@archlinux.us>
# Maintainer: Valere Monseur <valere dot monseur at ymail dot com>

pkgname=xfdesktop-standalone
_pkgname=xfdesktop
pkgver=4.8.2
pkgrel=1
pkgdesc="A desktop manager for Xfce - standalone version"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('libxfce4ui' 'hicolor-icon-theme' 'libwnck>=2.30.0')
makedepends=('intltool')
provides=('xfdesktop')
conflicts=('xfce4-menueditor')
replaces=('xfce4-menueditor')
options=('!libtool')
install=xfdesktop.install
source=(http://archive.xfce.org/src/xfce/${_pkgname}/4.8/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('ed25d59f478afda552d121e96657d16f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-desktop-icons \
    --disable-file-icons \
    --disable-gio-unix \
    --disable-thunarx \
    --disable-exo \
    --disable-notifications \
    --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
