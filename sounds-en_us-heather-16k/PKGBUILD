# Maintainer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Amateurfunk Station der Hochschule Niederrhein (DF0FN) <df0fn@hs-niederrhein.de>
pkgname=('sounds-en_us-heather-16k')
pkgver="13.03"
pkgrel=1
arch=('any')
url="http://sourceforge.net/projects/svxlink/"
license=('GPL')
pkgdesc="Sound Package en_US-heather-16k from svxlink in high quality"
depends=('svxlink')
source=("${pkgname}-${pkgver}.tar.bz2::http://sourceforge.net/projects/svxlink/files/sounds/${pkgver}/sounds-en_US-heather-16k-${pkgver}.tar.bz2")
sha256sums=('41c66bac28fa5a946da99f72b232cc16780ad99f23b276ba0b84e615d4ac7b8d')

package(){
  mkdir -p "${pkgdir}/usr/share/svxlink/sounds/en_US-heather-16k"
  cp -a "${srcdir}/en_US-heather-16k" "${pkgdir}/usr/share/svxlink/sounds/"
  cd "${pkgdir}/usr/share/svxlink/sounds"
}


