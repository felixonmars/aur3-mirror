# Contributor: Roberto Alsina <ralsina@netmanagers.com.ar>

pkgname=ttf-tuffy-infant2
pkgver=1
pkgrel=2
pkgdesc="A font for teachers"
arch=('any')
url="http://forum.high-logic.com/viewtopic.php?t=1138"
license=('Public domain')
depends=('fontconfig' 'xorg-font-utils')

install=ttf.install
source=(http://home.ripway.com/2003-4/5317/Fonts/TUFINF2.ttf)

build() {
    cd $startdir/src
    install -Dm 644 TUFINF2.ttf $pkgdir/usr/share/fonts/TTF/tufinf2.ttf
}
md5sums=('2b276dc16dc4dbb73067c4454960d8db')
