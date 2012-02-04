# Author: DeviantMM <http://deviantmm.deviantart.com/>
# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=gnome-shell-theme-sugar
pkgver=1.0
pkgrel=1
pkgdesc="A Milky GNOME Shell theme."
url="http://deviantmm.deviantart.com/art/Sugar-273937253"
license=('GPL')
arch=('any')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/273937253/sugar_by_deviantmm-d4j3fc5.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('db2fffa8d7a704ac0da70a4cd9e75235')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  mv "${srcdir}/Sugar/gnome-shell/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  mv "${srcdir}/Sugar" "${pkgdir}/usr/share/themes/"
  
  find "${pkgdir}" -name '*~' -type f -exec rm -f '{}' \;
}

