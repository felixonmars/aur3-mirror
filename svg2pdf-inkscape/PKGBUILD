# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>

pkgname=svg2pdf-inkscape
pkgver=0.1
pkgrel=1
pkgdesc="Converting SVG to PDF using Inkscape"
arch=('any')
url=('http://inkscape.org')
license=('GPL')
depends=('inkscape')
md5sums=('1afce98c7a7188b388a23c282109d514')
conflicts=('svg2pdf' 'svg2pdf-git')

source=(svg2pdf)

build(){

  mkdir -p ${pkgdir}/usr/bin
  install -m0755 ${srcdir}/svg2pdf ${pkgdir}/usr/bin
}
