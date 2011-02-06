# Maintainer: h31 <h31mail@yandex.com>

pkgname=tclmore
pkgver=0.7b1
pkgrel=1
pkgdesc="More TCL commands"
arch=(any)
url="http://download.gna.org/tclmore/0.7/"
license=("BSD")
depends=('tcl')
makedepends=('make')
#install=
md5sums=('0b93449da47f7b558d8af6329ac8c192'
         '401eb39ee4c39edb71c3785a17533ef8'
         'e460db5596ddaab1bf4ca31d9047bb67'
         '1d122f3b273bad841d168eb1819f792b')
source=(http://download.gna.org/$pkgname/0.7/${pkgname}_${pkgver}_src.tar.gz configure.patch Makefile.in.patch pkgIndex.tcl.in.patch)

build() {
  cd ${pkgname}_${pkgver}
  patch -Np0 -i "${srcdir}/configure.patch" || return 1
  patch -Np0 -i "${srcdir}/Makefile.in.patch" || return 1
  patch -Np0 -i "${srcdir}/pkgIndex.tcl.in.patch" || return 1
  ./configure --prefix=/usr
  make || return 1
  make INSTALL_ROOT=$startdir/pkg install
}