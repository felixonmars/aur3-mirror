# Contributor: Chris Griffith <codelicious.griffith at gmail dot com>
pkgname=xpsb-glx
pkgver=0.18
pkgrel=3
pkgdesc="X11 drivers for Poulsbo (psb) 3D acceleration"
arch=('i686')
url="http://ppa.launchpad.net/ubuntu-mobile/ubuntu/pool/main/x/"
license=('custom')
groups=()
depends=('libdrm-poulsbo>=2.3.0' 'xorg-server>=1.6')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!libtool')
install=
source=("http://ppa.launchpad.net/ubuntu-mobile/ubuntu/pool/main/x/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
noextract=()
md5sums=('9d14c7e16a72db1923c1a7801cf347c7')

build() {
  #nothing to build, just move some files
  install -dm 755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 ${srcdir}/${pkgname}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}

  install -dm 755 ${pkgdir}/usr/lib/va/drivers
  install -m 755 ${srcdir}/${pkgname}/dri/psb_drv_video.so ${pkgdir}/usr/lib/va/drivers

  install -dm 755 ${pkgdir}/usr/lib/xorg/modules/dri
  install -m 755 ${srcdir}/${pkgname}/dri/psb_dri.so ${pkgdir}/usr/lib/xorg/modules/dri

  install -dm 755 ${pkgdir}/usr/lib/xorg/modules/drivers
  install -m 755 ${srcdir}/${pkgname}/drivers/* ${pkgdir}/usr/lib/xorg/modules/drivers
}
