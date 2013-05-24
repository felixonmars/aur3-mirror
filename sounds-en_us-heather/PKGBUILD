# Maintainer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Carsten Feuls (DL1CAF) 'Der Techniker' <dl1caf@vfdb.org>
# Contributer: Amateurfunk Station der Hochschule Niederrhein (DF0FN) <df0fn@hs-niederrhein.de>
pkgname=('sounds-en_us-heather')
pkgver="13.03"
pkgrel=2
arch=('any')
url="http://sourceforge.net/projects/svxlink/"
license=('GPL')
pkgdesc="Sound Package en_US-heather from svxlink in medium quality"
depends=('svxlink')
source=("${pkgname}-${pkgver}.tar.bz2::http://sourceforge.net/projects/svxlink/files/sounds/${pkgver}/sounds-en_US-heather-${pkgver}.tar.bz2")
sha256sums=('d898054fbdb9ced0a6fedbd5dcabedaa7397e2be74acda3c0af8bff79bf4a289')

package(){
  mkdir -p "${pkgdir}/usr/share/svxlink/sounds/en_US-heather"
  cp -a "${srcdir}/en_US-heather" "${pkgdir}/usr/share/svxlink/sounds/"
  cd "${pkgdir}/usr/share/svxlink/sounds"
}
