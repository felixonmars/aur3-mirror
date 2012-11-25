# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=7z-sfx-tools
pkgver=1.4.3
pkgrel=1
pkgdesc="Set of tools for 7z SFX archives"
arch=('any')
url="https://bitbucket.org/codekoala/7z-sfx-tools"
license=('LGPL')
depends=('p7zip')
makedepends=('p7zip' 'licenses')
provides=('7z-sfx-tools')
source=("http://7zsfx.solta.ru/files/7zsd_tools_143_2367.7z")
md5sums=('120e7047b518748615d2538be2911128')

package() {
  install -d "${pkgdir}/usr/lib/p7zip/"

  cp "${srcdir}"/*.sfx "${pkgdir}/usr/lib/p7zip/"
  install -D "/usr/share/licenses/common/LGPL/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
