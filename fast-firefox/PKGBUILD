# Maintainer: felipe.facundes <felipe dot facundes at gmail dot com>
#

pkgname=fast-firefox
pkgver=1.0
pkgrel=1
pkgdesc="Fast-Firefox.sh is a SCRIPT that accelerates at 35% your Firefox Browser with Security."
arch=('any')
depends=('firefox')
url='https://www.mozilla.org/en-US/firefox/desktop/'
makedepends=('tar')
license=('GPL')
source=('fast-firefox.sh'
'fast-firefox.desktop'
'fast-firefox.png'
)

build()
{
  cd "$srcdir"
  install -Dm 755 ${pkgname}.sh		${pkgdir}/usr/bin/${pkgname}.sh
  install -Dm 644 ${pkgname}.desktop	${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm 644 ${pkgname}.png	${pkgdir}/usr/share/pixmaps/${pkgname}.png
}

md5sums=('4c0beaa94c0d8baf7ed02e5e98571c1c'
'416dc5106f1a87efd96f45785731e6ea'
'61eb9fdd4efa8296acb65fa14f8a28e9'
) 
