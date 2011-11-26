# Maintainer: demonicmaniac <namida1@gmx.net>

pkgname=raize
pkgver=1
pkgrel=1
pkgdesc="A monospaced bitmap font for X11"
arch=('any')
url="http://www.raize.com/DevTools/Tools/RzFont.asp"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(http://www.raize.com/DevTools/Tools/raize_font_linux-1.0.tar.gz)


package () {
  cd "$srcdir/raize_font_linux"

  install -d "$pkgdir/usr/share/fonts/local"

  install -m644 *.pcf "$pkgdir/usr/share/fonts/local/"
}

md5sums=('3d206c25b4cabbf922f4e143546608d4')
