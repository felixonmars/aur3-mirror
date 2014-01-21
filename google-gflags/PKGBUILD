# Maintainer: Kohei Ozaki <eow.ner+aur@gmail.com>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
pkgname=google-gflags
pkgver=2.0
pkgrel=2
pkgdesc="Commandline flags module for C++"
arch=(i686 x86_64)
license=('BSD3')
url="http://code.google.com/p/google-gflags/"
makedepends=('make' 'gcc')
options=('!libtool')
source=(http://gflags.googlecode.com/files/gflags-${pkgver}.tar.gz)
md5sums=('e02268c1e90876c809ec0ffa095da864')

build() {
  cd "${srcdir}/gflags-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/gflags-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
