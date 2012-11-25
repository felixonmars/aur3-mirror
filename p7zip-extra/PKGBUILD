# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=p7zip-extra
pkgver=9.22
pkgrel=1
pkgdesc="Extra modules for 7-Zip"
arch=('any')
url="http://www.7-zip.org/"
license=('custom:7-zip')
depends=('p7zip')
makedepends=('p7zip')
provides=('p7zip-extra')
source=("http://prdownloads.sourceforge.net/sevenzip/7-Zip/7z922_extra.7z")
md5sums=('f6e704bad4e0441789d6afcd0078dfb5')

package() {
  install -d "${pkgdir}/usr/lib/p7zip/"

  cp "${srcdir}"/*.sfx "${pkgdir}/usr/lib/p7zip/"
  install -D "${srcdir}/License.txt" "${pkgdir}/usr/share/licenses/p7zip-extra/LICENSE"
}

# vim:set ts=2 sw=2 et:
