# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: AndyRTR <andyrtr@archlinux.org>
# Original Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-intel-mir-bzr
_stable_ver=2.21.6
pkgver=5785
pkgrel=1
pkgdesc="X.org Intel i810/i830/i915/945G/G965+ video drivers"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
groups=('xorg-drivers' 'xorg')
depends=('intel-dri' 'libxvmc' 'xcb-util>=0.3.9' 'systemd')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=13' 'resourceproto' 'scrnsaverproto' 'libx11' 'libxrender')
makedepends+=('bzr')
replaces=('xf86-video-intel-uxa' 'xf86-video-intel-sna')
provides=('xf86-video-intel-uxa' 'xf86-video-intel-sna')
conflicts=('xorg-server<1.13.0' 'X-ABI-VIDEODRV_VERSION<13' 'X-ABI-VIDEODRV_VERSION>=14'
           'xf86-video-intel-sna' 'xf86-video-intel-uxa' 'xf86-video-i810' 'xf86-video-intel-legacy')
provides+=("xf86-video-intel=${_stable_ver}")
conflicts+=('xf86-video-intel')
options=('!libtool')
install=xf86-video-intel.install
source=("xf86-video-intel::bzr+http://bazaar.launchpad.net/~mir-team/mir/xf86-video-intel-vladmir/")
sha512sums=('SKIP')

pkgver() {
  cd xf86-video-intel
  bzr revno
}

build() {
  cd "${srcdir}/xf86-video-intel"
  autoreconf -vfi
  ./configure --prefix=/usr --enable-dri
  make
}

package() {
  cd "${srcdir}/xf86-video-intel"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
