# Maintainer: RA Dominguez <witchuntr7@gmail.com>
pkgname=modflow2005
pkgver=1.11
pkgrel=1
pkgdesc="USGS finite-difference ground water flow model"
arch=('i686' 'x86_64')
url="http://water.usgs.gov/ogw/modflow/MODFLOW.html"
license=('none')
provides=('mf2005')
source=("http://water.usgs.gov/ogw/modflow/MODFLOW-2005_v1.11.00/mf2005v1_11_00_unix.zip")
sha256sums=('d797abe71aebf83cb874b7610ca545efc4e6a7822ddaeabd35543c1ad022b69c')
makedepends=('gcc-fortran')

build(){
  cd "Unix/src"
  make mf2005 -j1 F90=gfortran
}

package(){
  # Binary
  cd "Unix/src"
  install -d "${pkgdir}/usr/bin/"
  install -Dm755 mf2005 "${pkgdir}/usr/bin/"
  # Documentation
  cd "../doc"
  install -d "${pkgdir}/usr/share/doc/modflow2005"
  install -Dm644 *.pdf "${pkgdir}/usr/share/doc/modflow2005"
  cd ".."
  install -Dm644 {Mf2005,readme,release}.txt "${pkgdir}/usr/share/doc/modflow2005"
}
