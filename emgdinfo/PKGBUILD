# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=emgdinfo
pkgver=1.8.0
_pkgver=1.0.2
pkgrel=4
pkgdesc="EMGD-info tool"
arch=('i686')
license=('custom')
url="http://edc.intel.com/Software/Downloads/EMGD/"
depends=('gcc-libs' 'libxext' 'ncurses' 'readline' 'libstdc++5' 'libdrm' 'xproto' 'libxrandr' 'libx11' 'libpciaccess' 'dkms-emgd' 'xf86-video-emgd')
source=(https://launchpad.net/~gma500/+archive/emgd-fix/+files/${pkgname}_${pkgver}-${_pkgver}~oneiric.tar.gz)
md5sums=('5302f7896ca6d4e20c239075a72c8ef3')

package() {
     cd ${srcdir}/${pkgname}-${pkgver}
     install -Dm755 emgdinfo ${pkgdir}/usr/bin/emgdinfo
     install -Dm644 libemgdinfo.so ${pkgdir}/usr/lib/libemgdinfo.so
     install -Dm644 libemgdinfo.a ${pkgdir}/usr/lib/libemgdinfo.a
} 
