# $Id:$
# Contributor: Balwinder S Dheeman <bdheeman@gmail.com>

pkgname=otf-saabfont
pkgver=0.91
pkgrel=1
pkgdesc="Unicode 4.0 compliant, OpenType, Gurmukhi (Punjabi) font, by PCRC"
arch=('any')
url='http://guca.sourceforge.net/'
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
install=${pkgname}.install
source=(http://nchc.dl.sourceforge.net/project/guca/Saab%20Font/${pkgver}/saab.${pkgver}.zip)

build() {
    cd ${srcdir}
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 *.otf ${pkgdir}/usr/share/fonts/TTF/
}

md5sums=('73391a1992dc8693f4b9818bde417dd3')
