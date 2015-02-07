# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=cpaurball
pkgver=1.1
pkgrel=1
pkgdesc="Tool for submitting source tarballs to the AUR"
arch=('any')
url="https://github.com/silentboatman/cpaurball"
license=('GPL3')
source=("https://github.com/silentboatman/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7cfbc34654c6cd280c13d4b45cdda9e013b9418706d963ea91e75acfd8eaaa30')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D cpaurball "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
