# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=spoc
pkgver=130624
pkgrel=4
pkgdesc="Stream Processing With OCaml, easy use of Cuda and OpenCL in OCaml"
url="http://www.algo-prog.info/spoc/web/"
arch=('x86_64' 'i686')
license=('CeCILL-B')
depends=('ncurses')
makedepends=('ocaml' 'mesa' 'freeglut' 'glu' 'gcc')
optdepends=('cuda')
conflicts=('spoclevel')
replaces=('spoclevel')
options=(staticlibs)
source=("http://www.algo-prog.info/spoc/distribution/SPOC-${pkgver}.tar.gz"
"config.new")
md5sums=('a12889e1bc003b8c6ba08831eda449ab'
         '7692ceace53ad07bf8fdae64f4406ed0')

build() {
  cd ${srcdir}/SPOC-${pkgver}/Spoc
  cp -v ${srcdir}/config.new ${srcdir}/SPOC-${pkgver}/config
  sed -i -e"s/-fPIC -O0/-fPIC -O/" Makefile
  make
  make htdoc
}

package() {
  cd "${srcdir}/SPOC-${pkgver}/Spoc"
  make DESTDIR="${pkgdir}" install
}

