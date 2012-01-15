# Maintainer: <kfgz at interia dot pl>

pkgname=qap
_examples_ver=0.5.3
pkgver=0.5.2
pkgrel=1
pkgdesc="Quadratic assignment problem solver"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/metslib/wiki/QuadraticAssignmentProblem"
license=('GPL3')
depends=('metslib')
source=(http://www.coin-or.org/download/source/metslib/Examples-${_examples_ver}.tgz)
md5sums=('33614bbfc74a3e52007de0c643c7d4a0')

build() {
  cd "${srcdir}"/Examples-${_examples_ver}/qap-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/Examples-${_examples_ver}/qap-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -dm755 "${pkgdir}"/usr/share/qap/examples
  install -m644 data/* "${pkgdir}"/usr/share/qap/examples
  rm "${pkgdir}"/usr/share/qap/examples/Makefile*
}
