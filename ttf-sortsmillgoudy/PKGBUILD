# Maintainer: Your Name brandon.waskiewicz@gmail.com
pkgname=ttf-sortsmillgoudy
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Sorts Mill Goudy true type and open type fonts"
arch=('any')
url="http://www.theleagueofmoveabletype.com/fonts/6-sorts-mill-goudy"
license=('Open Font License')
groups=()
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=(http://s3.amazonaws.com/theleague-production/fonts/sorts-mill-goudy.zip)
noextract=('sorts-mill-goudy.zip')
md5sums=('e6ef9a3205e7fd87445b9b401a91568e')

build() {
  cd "$srcdir/"
  unzip sorts-mill-goudy.zip *.otf *.ttf
  mkdir -p $pkgdir/usr/share/fonts/OTF
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp *.otf $pkgdir/usr/share/fonts/OTF
  cp *.ttf $pkgdir/usr/share/fonts/TTF
}

# vim:set ts=2 sw=2 et:
