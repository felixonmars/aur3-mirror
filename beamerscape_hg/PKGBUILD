# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=beamerscape_hg
pkgver=0.4
pkgrel=1
pkgdesc="Tools for integrating Inkscape and LaTeX beamer"
arch=('any')
url="https://code.google.com/p/beamerscape/"
license=('BSD')
depends=('texlive-publishers' 'perl' 'perl-xml-libxml')
provides=('beamerscape')

build() {
  [ -d ${srcdir}/${pkgname} ] || mkdir -p ${srcdir}/${pkgname}
  cd ${srcdir}/${pkgname}
  hg clone https://code.google.com/p/beamerscape .
}

package() {

  cd ${srcdir}/${pkgname}
  [ -d ${pkgdir}/usr/bin ] ||  mkdir -p ${pkgdir}/usr/bin
  install -m755 export_overlays ${pkgdir}/usr/bin

}
