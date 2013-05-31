# Maintainer: onefire <onefire.myself@gmail.com>
pkgname=libscl
pkgver=20130531
pkgrel=1
pkgdesc="A C++ statistical computing library built upon a C++ matrix class.  It's usage is similar in style to Matlab, Gauss, and R."
arch=('any')
url="http://public.econ.duke.edu/webfiles//arg/"${pkgname}""
depends=('atlas-lapack')
provides=('libscl')
license=('GPL')

source=("http://public.econ.duke.edu/webfiles//arg/${pkgname}/${pkgname}.tar"
        "${pkgname}.txt"
        "COPYING")
sha512sums=('4d6cabf180729c5bf017b60c398025ec772817a3024347fef3d9950b1c5c41abf1cb7fef36b12c7eb81ad975a3853c4d6ab973ed8e7fb3a019bf3a2776909c85'
            '8b9409b5aecde07f0e52fc89377f1fb2b56f59c13c0e1171129eb365e1dac5219ff7d4f36c0d23d414af1eef89b5d105912985e80977255605e77b096cf1fb26'
            'b94f571dda83fb3adee5789b8ae838fc458af73724e379bd67283aa7e687b5ab49d147fa4f0199492a0d377c6afd724293838c67c7c1a120b759250a74f70a78')

build() {
  cd "${srcdir}"/"${pkgname}"/gpp
  make
  cd ../cblas
  make
}

package() {
  mkdir -p "${pkgdir}"/usr/include
  mkdir -p "${pkgdir}"/usr/lib
  install -Dm 644 "${pkgname}".txt "${pkgdir}"/usr/share/doc/"${pkgname}"/"${pkgname}".txt
  install -m 644 COPYING "${pkgdir}"/usr/share/doc/"${pkgname}"/COPYING
  cd "${srcdir}"/"${pkgname}"
  install -m 644 copyrite "${pkgdir}"/usr/share/doc/"${pkgname}"/COPYRIGHTS 
  for i in frontend src gpp
  do
    install -m 755 $i/*.h "${pkgdir}"/usr/include
  done
  install -m 755 cblas/"${pkgname}"cb.a "${pkgdir}"/usr/lib
  install -m 755 gpp/"${pkgname}".a "${pkgdir}"/usr/lib
}


