# Contributor: Chris Griffith <codelicious.griffith at gmail dot com>
pkgname=psb-firmware
pkgver=0.30
pkgrel=1
pkgdesc="Binary firmware for the Poulsbo (psb) 3D X11 driver"
arch=('i686')
url="http://ppa.launchpad.net/ubuntu-mobile/ubuntu/pool/main/p/"
license=('custom')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://ppa.launchpad.net/ubuntu-mobile/ubuntu/pool/main/p/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
noextract=()
md5sums=('e7c4d6f769a29438e4160cec4ea94022')

build() {
  #nothing to compile, just move binary and license files
  install -dm 755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -m 644 ${srcdir}/${pkgname}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}

  install -dm 755 ${pkgdir}/lib/firmware
  install -m 644 ${srcdir}/${pkgname}/msvdx_fw.bin ${pkgdir}/lib/firmware
}