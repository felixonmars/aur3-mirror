# Maintainer: Gustavo Castro <gustawho[at]gmail[dot]com>

pkgname=2hdmc
_altname=2HDMC
pkgver=1.6.5
pkgrel=2
pkgdesc="General-purpose calculator for the two-Higgs doublet model."
url="http://2hdmc.hepforge.org/"
arch=('x86_64')
license=('GPLv2')
depends=('gsl')
optdepends=('sushi4physics: to calculate cross sections for Higgs production'
            'higgsbounds: for Higgs mass constraints')
makedepends=('gcc-fortran' 'doxygen')
source=("http://www.hepforge.org/archive/${pkgname}/${_altname}-${pkgver}.tar.gz")
sha512sums=('2f85ff74f0965d685b1ef04f3cb8fe91ede684ae45f540770e0ed6b0e5d85d8fd919986d87068f266de8776f56f8ddc70bb24886eab7d83e14b4c43023755974')
install='2hdmc.install'

build() {
  cd "${srcdir}/${_altname}-${pkgver}"
  make
  doxygen Doxyfile
}

package() {
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/doc/${_altname}" "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/share/doc/${_altname}/latex" "${pkgdir}/usr/share/doc/${_altname}/html"
  cd "${srcdir}/${_altname}-${pkgver}"
  install -m755 Calc* "${pkgdir}/usr/bin/"
  install -m755 Demo "${pkgdir}/usr/bin/"
  install -m755 lib/* "${pkgdir}/usr/lib/"
  install -g users -m644 html/* "${pkgdir}/usr/share/doc/${_altname}/html/"
  install -g users -m644 latex/* "${pkgdir}/usr/share/doc/${_altname}/latex/"
}

# vim:set ts=2 sw=2 et:
