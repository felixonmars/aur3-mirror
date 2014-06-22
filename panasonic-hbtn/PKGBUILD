# $Id$
# Maintainer: Heiher <r@hev.cc>

pkgname=panasonic-hbtn
pkgver=3.15.7c030c8
pkgrel=1
pkgdesc="Panasonic Tablet Button driver"
arch=('i686' 'x86_64')
url="https://github.com/heiher/panasonic-hbtn"
license=('GPL')
depends=('linux')
install=module.install
source=(git://github.com/heiher/panasonic-hbtn#commit=7c030c8951fec21f16e985e77a488c97c81ccd74)
sha1sums=('SKIP')

build() {
  cd ${pkgname}

  make
  gzip ${pkgname}.ko
}

package() {
  cd ${pkgname}

  KVER=`uname -r | grep -wo -P "^\d\.\d+"`
  EDIR=${pkgdir}/usr/lib/modules/extramodules-${KVER}-ARCH
  install -dm755 ${EDIR}
  install -m644 ${pkgname}.ko.gz ${EDIR}/${pkgname}.ko
}
