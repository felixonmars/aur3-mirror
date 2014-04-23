# Maintainer: Никола Вукосављевић <hauzer@gmx.com>

pkgname=rbvp
pkgver=1.2.3
pkgrel=3
pkgdesc="Pick a random verse from the Bible that match the given words."
arch=('any')
url="https://sourceforge.net/projects/${pkgname}/"
license=('Public Domain')
depends=('bible-kjv')
makedepends=('euphoria')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}.eu")
noextract=("${pkgname}.eu")
sha512sums=('dacdd8da6579ef6db2175b707414e1aa0d00d29af40c2d0393ebdda818b887f68f9ff55dff86472b142f4c047d7f040045348155d90bacc0bc35d7e56498a9ba')

build() {
  euc "${srcdir}/${pkgname}.eu"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.eu" "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin"
}

