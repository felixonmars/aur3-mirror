# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

pkgname=xf86-video-ati-plymouth
_pkgname=xf86-video-ati
pkgver=6.14.2
pkgrel=1
pkgdesc="X.org ati video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=(libpciaccess libdrm udev pixman ati-dri)
makedepends=('xorg-server-devel' 'libdrm' 'xf86driproto' 'mesa' 'glproto')
conflicts=('xorg-server<1.10.0' "${_pkgname}")
groups=('xorg-drivers' 'xorg')
options=('!libtool')
provides=("${_pkgname}=${pkgver}")
source=("${url}/releases/individual/driver/${_pkgname}-${pkgver}.tar.bz2"
        'radeon-6.9.0-bgnr-enable.patch')
md5sums=('111ec4aef32a4298df7e38afa8bef373'
         '6ba0dea60d4c7267fdbe6095753b51a6')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/radeon-6.9.0-bgnr-enable.patch"

  ./configure --prefix=/usr --enable-dri
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make "DESTDIR=${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
