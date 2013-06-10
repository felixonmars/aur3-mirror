# Maintainer: Nathan Typanski <n.typanski at gmail dot com>

pkgname=libxrandr-prime-git
pkgver=1.3.2.10.g0d8049f
pkgrel=1
pkgdesc="David Airlie's prime X11 RandR extension library"
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
provides=('libxrandr')
conflicts=('libxrandr')
depends=('libxext' 'libxrender' 'randrproto>=1.4.0')
makedepends=('xorg-util-macros')
options=('!libtool')
source=(libxrandr-prime-git::git://people.freedesktop.org/~airlied/libXrandr.git#branch=prime)
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --always | sed 's|libXrandr.||g;s|-|.|g'
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
}
