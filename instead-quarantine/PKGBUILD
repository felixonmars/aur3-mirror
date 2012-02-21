# Maintainer Kovivchak Evgen <oneonfire@gmail.com>

pkgname=instead-quarantine
pkgver=0.3.7
pkgrel=2
pkgdesc="Quest with nonlinear plot"
arch=('any')
url="http://code.google.com/p/instead-games/"
license=('custom')
depends=('instead')
source=(http://instead-games.googlecode.com/files/${pkgname}-${pkgver}.zip)
md5sums=('c74d64d0f14301dfb6c0aa41beeb5a05')
package() {
  cd "${srcdir}"
  mkdir -p ${pkgdir}/usr/share/instead/games/quarantine/{gfx,snd,theme}
  install -m644 quarantine/gfx/* ${pkgdir}/usr/share/instead/games/quarantine/gfx 
  install -m644 quarantine/snd/* ${pkgdir}/usr/share/instead/games/quarantine/snd 
  install -m644 quarantine/theme/* ${pkgdir}/usr/share/instead/games/quarantine/theme 
  install -m644 quarantine/{game.lua,intro.lua,main.lua,theme.ini} ${pkgdir}/usr/share/instead/games/quarantine/ 
}

