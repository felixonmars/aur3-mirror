# Maintainer: Mike Dacre <mike@dacre.me>
pkgname=peer
pkgver=1.3
pkgrel=1
pkgdesc="A collection of Bayesian approaches to infer hidden determinants and their effects from gene expression profiles using factor analysis methods"
arch=('i386' 'i686' 'x86_64')
url="https://github.com/PMBio/peer"
license=('custom')
depends=('r' 'python2' 'python2-numpy' 'python2-scipy')
makedepends=('cmake' 'swig')
source=("https://github.com/downloads/PMBio/peer/${pkgname}_source_${pkgver}.tar.gz"
        "https://github.com/downloads/PMBio/peer/R_${pkgname}_source_${pkgver}.tgz")
noextract=("R_${pkgname}_source_${pkgver}.tgz")
md5sums=('42224888eceb5260ff0547ca65182e99'
         'b5570546d219c53f983bff8a725492f4')

prepare() {
  cd "${srcdir}/${pkgname}"
  # Force python2
  find . -type f -name "*.py" | xargs perl -pi -e 's%^#![ ]*/usr/.*python.*%#!/usr/bin/python2%' 
}

build() {
  cd "${srcdir}/${pkgname}/build"
  cmake -D PYTHON_EXECUTABLE=/usr/bin/python2 ../
  make
}

package() {
  # Install R portion
  mkdir -p "${pkgdir}/usr/lib/R/library"
  R CMD INSTALL -l "${pkgdir}/usr/lib/R/library" "${srcdir}/R_${pkgname}_source_${pkgver}.tgz"

  # Install license
  mkdir -p "${pkgdir}/usr/share/licenses/peer"
  install -m0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/peer/"

  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}/" install
  mv "${pkgdir}/usr/local/lib/libpeerlib.a" "${pkgdir}/usr/lib/"
  cd "${pkgdir}/usr/local/lib"
  ln -s ../../lib/libpeerlib.a .
}
