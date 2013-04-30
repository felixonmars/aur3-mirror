# Maintainer: Josh VanderLinden <arch@cloudlery.com>
# URL https://bitbucket.org/codekoala/7z-sfx-tools

pkgname=7z-sfx-tools
pkgver=1.5
pkgrel=1
pkgdesc="Set of tools for 7z SFX archives"
arch=('any')
url="http://7zsfx.solta.ru/en/"
license=('LGPL')
depends=('p7zip')
makedepends=('p7zip' 'licenses')
provides=('7z-sfx-tools')
source=("http://7zsfx.solta.ru/files/7zsd_tools_150_2712.7z")
md5sums=('bc274eedd51c046fc76f5f77c9377d8b')

package() {
  install -d "${pkgdir}/usr/lib/p7zip/"

  cp "${srcdir}"/*.sfx "${pkgdir}/usr/lib/p7zip/"
  install -D "/usr/share/licenses/common/LGPL/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
