# Maintainer: Your Name brandon.waskiewicz@gmail.com
pkgname=otf-goudybookletter1911
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Goudy Bookletter 1911 open type font"
arch=('any')
url="http://www.theleagueofmoveabletype.com/fonts/8-goudy-bookletter-1911"
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
source=(http://s3.amazonaws.com/theleague-production/fonts/goudy-bookletter-1911.zip)
noextract=('goudy-bookletter-1911.zip')
md5sums=('7feeaffba19662bd34cfec8a58295580')

build() {
  cd "$srcdir/"
  unzip goudy-bookletter-1911.zip GoudyBookletter1911.otf
  mkdir -p $pkgdir/usr/share/fonts/OTF
  cp *.otf $pkgdir/usr/share/fonts/OTF
}

# vim:set ts=2 sw=2 et:
