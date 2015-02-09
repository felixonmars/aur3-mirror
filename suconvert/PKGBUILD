# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=suconvert
_gitpkgname=convert
pkgver=2.2.1
pkgrel=1
pkgdesc='Qt5 based Unit Converter for various scientific units'
url='https://www.chronowerks.de/cgit/convert.git/'
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('qt5-base' 'qt5-script')

build() {
  cd ${srcdir}
  git clone https://www.chronowerks.de/repos/${_gitpkgname}.git
  cd ${_gitpkgname}
  git checkout ${pkgver}
  qmake
  make -j4
}

package() {
  cd "${srcdir}/${_gitpkgname}"
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/${_gitpkgname}
  install -s bin/${_gitpkgname} ${pkgdir}/usr/bin/${pkgname}
  install -m 644 bin/data.rcc ${pkgdir}/usr/share/${_gitpkgname}/
}
