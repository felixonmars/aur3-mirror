# Maintainer: kfgz <kfgz at interia pl>

pkgname=qn24b
pkgver=1.0
pkgrel=1
pkgdesc="Benchmark that solves 24-queens problem. Openmp and standard version."
arch=('i686' 'x86_64')
url="http://www.arch.cs.titech.ac.jp/~kise/nq/index.htm"
license=('GPL')
source=(http://www.arch.cs.titech.ac.jp/~kise/nq/package/${pkgname}-version${pkgver}.tgz)
md5sums=('10fc6239b5e037b3c86890918d33b8f3')

build() {
  cd ${srcdir}/version${pkgver}/base
  rm qn24b_base
  make
  cd ../omp
  make
}

package() {
  cd ${srcdir}/version${pkgver}
  install -m755 -D base/qn24b_base ${pkgdir}/usr/bin/qn24b_base
  install -m755 -D omp/qn24b_openmp ${pkgdir}/usr/bin/qn24b_openmp
}
