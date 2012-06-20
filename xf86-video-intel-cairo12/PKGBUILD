# $Id: PKGBUILD 160623 2012-06-02 21:15:09Z andyrtr $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-intel-cairo12
_pkgname=xf86-video-intel
pkgver=2.19.0
pkgrel=1
pkgdesc="X.org Intel video drivers. Fixed bitmap fonts rendering with cairo 1.12"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('intel-dri' 'libxvmc' 'libpciaccess' 'libdrm' 'xcb-util>=0.3.9' 'libxfixes' 'udev>=183')
makedepends=('xorg-server-devel>=1.12.0' 'libx11' 'libdrm' 'xf86driproto' 'glproto' 'mesa' 'libxvmc' 'libxrender')
conflicts=('xorg-server<1.12.0' 'xf86-video-i810' 'xf86-video-intel-legacy' 'xf86-video-intel')
provides=( 'xf86-video-intel')
options=('!libtool')
groups=('xorg-drivers' 'xorg')
source=(${url}/releases/individual/driver/${_pkgname}-${pkgver}.tar.bz2 uxa-Implement-glyphs-to-dst-to-avoid-fallbacks.patch)
md5sums=('f397bddfc88d4c9b30b56526c1e02e8e'
         '9add8addd64e6a3c811fca058d9ec467')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 < $srcdir/uxa-Implement-glyphs-to-dst-to-avoid-fallbacks.patch
  ./configure --prefix=/usr --enable-dri
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
