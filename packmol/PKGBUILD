# PKGBUILD template to install packmol
# Maintainer: Hector Martinez-Seara Monne <hseara ##[at]## gmail?com>
pkgname=packmol
pkgver=14.225
pkgrel=1
pkgdesc="Creates an initial point for molecular dynamics simulations by packing molecules in defined regions of space."
depends=('gcc-libs' 'tcl' 'bash')
makedepends=('gcc-fortran')
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.ime.unicamp.br/~martinez/packmol/"
source=(http://leandro.iqm.unicamp.br/packmol/versionhistory/packmol-${pkgver}.tar.gz)
sha1sums=('024c2ef3df4adc584301b6124646f80b200984c8')

build() {
  cd ${srcdir}/packmol
  sed -i 's/maxatom     =    500000/maxatom     =   2000000/g' sizes.i
  sed -i 's/maxtype     =        50/maxtype     =       150/g' sizes.i
  ./configure
  make
  mv packmol packmol_serial
  make parallel
  mv packmol packmol_parallel
}

package() {
  cd ${srcdir}/packmol
  install -D -m755 packmol_serial ${pkgdir}/usr/bin/packmol_serial
  install -D -m755 packmol_parallel ${pkgdir}/usr/bin/packmol_parallel
  install -D -m755 ppackmol ${pkgdir}/usr/bin/ppackmol
  install -D -m755 solvate.tcl ${pkgdir}/usr/bin/solvate.tcl
  cd ${pkgdir}/usr/bin/
  ln -s /usr/bin/packmol_parallel ./packmol
}



