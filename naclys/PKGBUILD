# Maintainer: Pierre Chiche < pierre [dot] chiche [at] gmail [dot] com
pkgname=naclys
pkgver=0.0.10
pkgrel=1
pkgdesc="Latest client for the collaborative rendering farm Corefarm.org"
arch=('i686' 'x86_64')
url="http://www.corefarm.org/"
license=('unknown')
depends=()
source=(http://www.corefarm.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('8e3f505bf30a6ee1b0f807d37966a27b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed 's|NACLYS=/path/to/naclys/naclys|NACLYS=/usr/share/naclys/naclys-node|' -i launch.sh
  sed 's|UI_ROOT=doc_root|UI_ROOT=/usr/share/naclys/doc_root|' -i launch.sh
  install -Dm755 launch.sh ${pkgdir}/usr/bin/naclys
  install -Dm755 naclys ${pkgdir}/usr/share/naclys/naclys-node
  install -Dm755 sel_ldr ${pkgdir}/usr/share/naclys/sel_ldr
  msg "Please edit /usr/bin/naclys to set your login and password"
  cp -r doc_root/ ${pkgdir}/usr/share/naclys/
  cp README ${pkgdir}/usr/share/naclys/
}
