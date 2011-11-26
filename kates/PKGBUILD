# Maintainer: demonicmaniac <namida1@gmx.net>

pkgname=kates
pkgver=1
pkgrel=1
pkgdesc="A monospaced bitmap font for X11"
arch=('any')
url="http://www.gilesorr.com/bashprompt/xfonts/"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(http://www.gilesorr.com/bashprompt/xfonts/${pkgname}7x14.pcf.gz)
#md5sums=('e6defc76bdcf5ee1c4d4575b2a182a8e')

package () {
  cd "$srcdir"

  install -d "$pkgdir/usr/share/fonts/local"

  install -m644 *.pcf "$pkgdir/usr/share/fonts/local/"
}
md5sums=('ecb5a29e74a212cf3abbc519d95151fa')
