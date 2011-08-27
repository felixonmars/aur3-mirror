# $Id: PKGBUILD 110194 2011-02-17 14:29:12Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-intel-beta
pkgver=2.14.903
pkgrel=1
pkgdesc="X.org Intel i810/i830/i915/945G/G965+ video drivers, 2.15 beta"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org"
license=('custom')
depends=(intel-dri libxvmc libpciaccess libdrm xcb-util libxfixes udev)
makedepends=('xorg-server-devel' 'libx11' 'libdrm' 'xf86driproto' 'glproto' 'mesa' 'libxvmc' 'xcb-util')
provides=('xf86-video-intel')
conflicts=('xorg-server<1.9.0' 'xf86-video-i810' 'xf86-video-intel-legacy' 'xf86-video-intel')
options=('!libtool')
groups=('xorg-video-drivers')
source=(${url}/releases/individual/driver/xf86-video-intel-${pkgver}.tar.bz2)

build() {
  cd "${srcdir}/xf86-video-intel-${pkgver}"
  libtoolize --force
  autoreconf --force --install
  ./configure --prefix=/usr --enable-dri
  make
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/xf86-video-intel"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xf86-video-intel/"
}

md5sums=('ac961cea32dfcf4250cf5e14554226f9')
