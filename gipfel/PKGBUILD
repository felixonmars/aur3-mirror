# $Id$
# Maintainer: Dariusz Duma <dhor@toxic.net.pl>

pkgname=gipfel
pkgver=0.4.0
pkgrel=2
pkgdesc='Helps to find the names of mountains or points of interest on a picture'
arch=('i686' 'x86_64')
url='http://www.ecademix.com/JohannesHofmann/gipfel.html'
license=('GPL')
depends=('fltk' 'libtiff' 'gsl' 'libjpeg' 'exiv2')
optdepends=('enblend-enfuse: create panorama functionality')
options=('!emptydirs')
source=(http://www.ecademix.com/JohannesHofmann/gipfel-${pkgver}.tar.gz)
sha256sums=('30d155b436bdb03f6157d7279f4d342dd811ec85ed4adf1a2677ac3320d889ed')

build() {
  cd "${srcdir}/gipfel-${pkgver}"

  ./configure --prefix="/usr"
  make
}

package() {
  cd "${srcdir}/gipfel-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
