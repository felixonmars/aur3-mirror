# Maintainer: Matias De la Puente <mfpuente.ar@gmail.com>
pkgname=jalv2
pkgver=2.4o
_pkgname=jalv24o
pkgrel=1
pkgdesc="A compiler for the PIC microcontroller"
arch=('i686' 'x86_64')
url="http://www.casadeyork.com/jalv2/"
license=('custom')
depends=()
makedepends=()
optdepends=('jallib')
source=("http://www.casadeyork.com/jalv2/archive/${_pkgname}src.zip" 'jalv2.patch')
sha256sums=('4f467f6dbea916c913a5f0d96b57cc1d02958600abd4cfa487339a2b1892c337'
            'e2d0dc74b80b5591ba11167a07ea1948b80b72e6e08cc0db633315b1e258ec35' )

build() {
  cd "${srcdir}/${_pkgname}"
  
  patch -Np1 -i "${srcdir}/jalv2.patch"
  mkdir -p bin
  
  cd "${srcdir}/${_pkgname}/src"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  
  install -Dm755 "bin/jalv2" "${pkgdir}/usr/bin/jalv2"
  
  # install chipdef
  install -dm755 "${pkgdir}/usr/share/${pkgname}/chipdef"
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/chipdef/" ${srcdir}/${_pkgname}/chipdef/*
    
  # install documentation
  install -dm755 "${pkgdir}/usr/share/${pkgname}/doc"
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/doc" Documentation/* 
  
  # install custom license
  install -Dm644 "Documentation/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

