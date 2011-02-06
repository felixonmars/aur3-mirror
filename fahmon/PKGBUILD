# Maintainer: Tony Manco <trmanco@gmx.ca>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
pkgname=fahmon
_realname=FahMon
pkgver=2.3.99.4
pkgrel=3
pkgdesc="See the progress of your Folding@Home client"
arch=('i686' 'x86_64')
url="http://fahmon.net/"
license=('GPL')
depends=('curl' 'wxgtk' 'desktop-file-utils')
makedepends=('desktop-file-utils')
install=fahmon.install
options=('!emptydirs' '!libtool')
source=(http://fahmon.net/downloads/${_realname}-${pkgver}.tar.bz2 fahmon.desktop)
md5sums=('df08b8943b0adfa455ab82c14b25ff24' '97bae4d3b35810de7913eba449b7d692')

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_realname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/fahmon.desktop ${pkgdir}/usr/share/applications/fahmon.desktop
  install -Dm644 ${srcdir}/${_realname}-${pkgver}/src/images/dialog_icon.png \
    ${pkgdir}/usr/share/pixmaps/fahmon.png
}
