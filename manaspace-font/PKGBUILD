# Contributor: demonicmaniac < namida1@gmx.net >

pkgname=manaspace-font
pkgver=1
pkgrel=1
pkgdesc="Secret of Mana Font converted to TTF"
arch=('any')
url="http://www.zone38.net/font/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.zone38.net/font/manaspc_ger.zip)

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install *.ttf ${pkgdir}/usr/share/fonts/TTF

}


md5sums=('f9f00e48dce0cf5a8fae97654d8a0419')
