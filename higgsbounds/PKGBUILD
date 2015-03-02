# Maintainer: Gustavo Castro << gustawho [at] gmail [dot] com >>
pkgname=higgsbounds
_altname=HiggsBounds
pkgver=4.2.0
pkgrel=3
pkgdesc="Tests theoretical predictions of models with arbitrary Higgs sectors against the exclusion bounds obtained from the Higgs searches at LEP, the Tevatron and the LHC."
url="http://higgsbounds.hepforge.org/"
arch=('x86_64')
license=('GPLv3')
#optdepends=('feynhiggs: ')
makedepends=('gcc-fortran')
source=("http://www.hepforge.org/archive/$pkgname/$_altname-$pkgver.tar.gz"
        'feynhiggs.patch')
sha512sums=('43250768f8ec7044a983bb89d7d7c21cbd2226182d5b6f83f63e199313cc92ec6365fbb4731fe6ca78b3aeb07b19838776dfe73fa25880578df3a8c117657f3e'
            'f478e7481532f4ce7a800ade52e84acdde615a043f9b26dd1c22b085c555b85e331dcf9706e79d5bcb434455bded9ebfbec4175add67746a137f98504cc48208')

build() {
  patch "${srcdir}/${_altname}-${pkgver}/configure" < "${srcdir}/feynhiggs.patch"
  cd ${srcdir}/${_altname}-${pkgver}
  ./configure
  make
  make libHB
}

package() {
  cd "${srcdir}/${_altname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib" "${pkgdir}/usr/share/${pkgname}/examples/data" "${pkgdir}/usr/share/${pkgname}/examples/programs"
  install -m755 ./HiggsBounds "${pkgdir}/usr/bin/HiggsBounds"
  install -m755 ./libHB.a "${pkgdir}/usr/lib/libHB.a"
  install -m644 ./example_data/* "${pkgdir}/usr/share/${pkgname}/examples/data/"
  install -m644 ./example_programs/* "${pkgdir}/usr/share/${pkgname}/examples/programs/"
  rm -rf example_data example_programs configure* COPYING README makefile* *.F90 *.f90
  cp -r * "${pkgdir}/usr/share/${pkgname}/"
}

