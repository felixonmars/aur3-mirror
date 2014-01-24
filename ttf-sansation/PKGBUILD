# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=ttf-sansation
_realname=Sansation.font
pkgver=2
pkgrel=1
pkgdesc="Sansation True Type font"
arch=('any')
license=('custom:free')
url="http://bernd-montag.kernest.com/font_families/sansation"
_url="http://www.ffonts.net"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("$_url/$_realname.zip")

md5sums=('2bfc7679715554481ee8f270ce58bd00')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1

}

