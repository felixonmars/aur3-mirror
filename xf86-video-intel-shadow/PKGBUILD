# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-intel-shadow
_pkgname=xf86-video-intel
pkgver=2.20.4
pkgrel=1
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
install=$_pkgname.install
pkgdesc="X.org Intel i810/i830/i915/945G/G965+ video drivers (with shadow hack for the i845G chipset)"
depends=('intel-dri' 'libxvmc' 'libpciaccess' 'libdrm' 'xcb-util>=0.3.9' 'libxfixes' 'systemd-tools')
makedepends=('xorg-server-devel>=1.12.0' 'libx11' 'libdrm' 'xf86driproto' 'glproto' 'mesa' 'libxvmc' 'libxrender')
replaces=('xf86-video-intel-uxa' 'xf86-video-intel-sna')
provides=('xf86-video-intel-uxa' 'xf86-video-intel-sna')
conflicts=('xf86-video-intel-sna' 'xf86-video-intel-uxa' 'xorg-server<1.12.0' 'xf86-video-i810' 'xf86-video-intel-legacy')
options=('!libtool')
groups=('xorg-drivers' 'xorg')
source=(${url}/archive/individual/driver/${_pkgname}-${pkgver}.tar.bz2
        revert-shadow-hack.patch)
sha256sums=('f36d857a64a28b839abc4999e8e8f4704f5769ed284800fecc5dfd2aa03150d8'
            'e5acc24939e2997a4358457436dc8bd560326247bb54956d4e77ab8870f11d63')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/revert-shadow-hack.patch"
  autoreconf -fi
  ./configure --prefix=/usr \
    --enable-dri
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
