# Contributor: Natrio <natrio@list.ru>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-intel-old
pkgname_=xf86-video-intel
pkgver=2.21.14
pkgrel=2
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
pkgdesc="X.org Intel i810/i830/i915/945G/G965+ video drivers"
depends=('intel-dri' 'libxvmc' 'xcb-util>=0.3.9' 'systemd')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=14' 'resourceproto' 'scrnsaverproto' 'libx11' 'libxrender')
provides=('xf86-video-intel')
conflicts=('xorg-server<1.14.0' 'X-ABI-VIDEODRV_VERSION<14' 'X-ABI-VIDEODRV_VERSION>=15'
           'xf86-video-intel' 'xf86-video-i810' 'xf86-video-intel-legacy')
options=('!libtool')
groups=('xorg-drivers' 'xorg')
source=(${url}/archive/individual/driver/${pkgname_}-${pkgver}.tar.bz2)
sha256sums=('cc74d482dfd1f6b87773233a6d5c36118039b42fe7f8d99ee28bda7b78aa3b49')

build() {
  cd "${srcdir}/${pkgname_}-${pkgver}"

  ./configure --prefix=/usr \
    --enable-dri \
    --with-default-accel=sna

  make
}

package() {
  cd "${srcdir}/${pkgname_}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
