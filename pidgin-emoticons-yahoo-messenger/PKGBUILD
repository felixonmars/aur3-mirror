# Maintainer: scorici <scorici AT yahoo DOT com>
pkgname=pidgin-emoticons-yahoo-messenger
pkgver=11
pkgrel=1
pkgdesc="Default Yahoo! Messenger 11 Beta Smileys"
arch=(any)
url="https://developer.pidgin.im/wiki/ThirdPartySmileyThemes"
license=('unknown')
depends=(pidgin)
makedepends=(unzip)
source=('https://developer.pidgin.im/raw-attachment/wiki/ThirdPartySmileyThemes/Yahoo__Messenger_11_Smiley_Pack.zip')
md5sums=('82955d22399ede3a35c31fa1513e4deb')
package() {
mkdir -p $pkgdir/usr/share/pixmaps/pidgin/emotes
unzip -q *.zip -d $pkgdir/usr/share/pixmaps/pidgin/emotes
}

