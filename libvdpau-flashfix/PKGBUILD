# Maintainer : Rob McCathie <archaur at rmcc dot com dot au>
# Contributor: Jan de Groot <jgc@archlinux.org>

_name=libvdpau
pkgname=libvdpau-flashfix
_ver=4262513e67c3572ed19bd796ec6180cdde7ccb7e
pkgver=20120903
pkgrel=3
pkgdesc="Older Nvidia VDPAU library with nasty hack applied that does fix the 'blue people' issue with hardware accelerated Youtube videos in Midori and some other browsers. You must start browser with VDPAU_TRACE=1 set."
arch=(i686 x86_64)
url='http://cgit.freedesktop.org/~aplattner/libvdpau'
depends=('gcc-libs' 'libxext')
conflicts=('nvidia-utils<190.42-2' 'libvdpau')
provides=('libvdpau=0.4.1')
license=('custom')
install="$pkgname".install
source=(http://cgit.freedesktop.org/~aplattner/libvdpau/snapshot/libvdpau-4262513e67c3572ed19bd796ec6180cdde7ccb7e.tar.gz
        0001-vdpau_trace-WAR-Flash-quirks.patch)
makedepends=('dri2proto')
sha256sums=('d090f860db6fc30bdfc302b6afb0e2b7b77a98b58cd1f80ec74bc29b8ed51511'
            '446db56c9aad3ccb72447f44b3a77d143066531b68a489473da491850b64e348')

prepare() {
  cd "${srcdir}/${_name}-${_ver}"
  patch -Np1 -i "${srcdir}"/0001-vdpau_trace-WAR-Flash-quirks.patch
}

build() {
  cd "${srcdir}/${_name}-${_ver}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${_name}-${_ver}"
  make DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/usr/share/licenses/${_name}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_name}/"
}
