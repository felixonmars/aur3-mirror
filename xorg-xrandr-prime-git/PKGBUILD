# Maintainer: Nathan Typanski <n.typanski at gmail dot com>

pkgname=xorg-xrandr-prime-git
pkgver=1.3.5.7.ge4212ce
pkgrel=1
pkgdesc="David Airlie's prime branch of primitive command line interface to RandR extension"
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
conflicts=('xorg-xrandr')
provides=('xorg-xrandr')
depends=('libxrandr-prime-git' 'libx11')
makedepends=('xorg-util-macros')
options=('!libtool')
source=(xorg-xrandr-prime-git::git://people.freedesktop.org/~airlied/xrandr.git#branch=prime)
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --always | sed 's|xrandr.||g;s|-|.|g'
}

build() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
  rm -f "${pkgdir}/usr/bin/xkeystone"
}
