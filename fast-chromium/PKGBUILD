# Maintainer: felipe.facundes <felipe dot facundes at gmail dot com>
#

pkgname=fast-chromium
pkgver=1.0
pkgrel=1
pkgdesc="Fast-Chromium.sh is a SCRIPT that accelerates at 60% your Chomium Browser."
arch=('any')
depends=('chromium')
url='http://www.chromium.org'
makedepends=('tar')
license=('GPL')
source=('fast-chromium.sh'
'fast-chromium.desktop'
'fast-chromium.png'
)

build()
{
  cd "$srcdir"
  install -Dm 755 ${pkgname}.sh		${pkgdir}/usr/bin/${pkgname}.sh
  install -Dm 644 ${pkgname}.desktop	${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm 644 ${pkgname}.png	${pkgdir}/usr/share/pixmaps/${pkgname}.png
}

md5sums=('1b5580ef5caad89054742d3b51000f0d'
'8b7b4aed83bde67ec62e55d0ceef7392'
'1c0eeb6349e0de0669a548e19a749e79'
)