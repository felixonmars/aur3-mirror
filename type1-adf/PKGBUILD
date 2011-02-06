# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=type1-adf
pkgver=20100812
pkgrel=2
pkgdesc="PS-Type1 Font released by Arkandis Digital Foundry"
arch=('any')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('GPL2')
groups=('adf-fonts')
depends=('fontconfig' 'xorg-font-utils')
install=type1.install
source=(
http://arkandis.tuxfamily.org/fonts/Romande-Std-20100807.zip
)

md5sums=('3d8b3bd8adba33986ed47781e457d89b')

build() {
  # nothing to do
  true
}

package() {
  install -d ${pkgdir}/usr/share/fonts/Type1/
  install -Dm644 ${srcdir}/*/[Pp][Ss]-[Tt][Yy][Pp][Ee]1/*.* ${pkgdir}/usr/share/fonts/Type1/
}
