# Maintainer: Gordin <gordin @t gmail dot com>

pkgname=xf86-video-intel-virtual-crtc
_pkgname=xf86-video-intel
pkgver=2.21.14
pkgrel=1
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
install=$pkgname.install
pkgdesc="X.org Intel i810/i830/i915/945G/G965+ video drivers, with virtual crtc patch"
depends=('intel-dri' 'libxvmc' 'xcb-util>=0.3.9' 'systemd')
makedepends=('xorg-server-devel' 'X-ABI-VIDEODRV_VERSION=14' 'resourceproto' 'scrnsaverproto' 'libx11' 'libxrender')
replaces=('xf86-video-intel-uxa' 'xf86-video-intel-sna')
provides=('xf86-video-intel' 'xf86-video-intel-uxa' 'xf86-video-intel-sna')
conflicts=('xf86-video-intel' 'xorg-server<1.14.0' 'X-ABI-VIDEODRV_VERSION<14' 'X-ABI-VIDEODRV_VERSION>=15'
           'xf86-video-intel-sna' 'xf86-video-intel-uxa' 'xf86-video-i810' 'xf86-video-intel-legacy')
options=('!libtool')
groups=('xorg-drivers' 'xorg')
source=(${url}/archive/individual/driver/${_pkgname}-${pkgver}.tar.bz2
        'https://raw.github.com/Gordin/patches/master/hacks/xserver-xorg-video-intel-2.21.14_virtual_crtc.patch')
sha256sums=('cc74d482dfd1f6b87773233a6d5c36118039b42fe7f8d99ee28bda7b78aa3b49'
            '3050aa136befdb3ce473b5a07f11970c2c857161a621e054040d41769c423ddb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i ${srcdir}/xserver-xorg-video-intel-2.21.14_virtual_crtc.patch
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
