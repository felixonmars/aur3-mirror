# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=ttf-walkway
_realname=Walkway.font
pkgver=2
pkgrel=1
pkgdesc="Walkway True Type font"
arch=('any')
license=('custom:free')
url="http://moorstation.org/typoasis/designers/gemnew/home.htm"
_url="http://www.ffonts.net"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("$_url/$_realname.zip")

md5sums=('1e088915bf790fd4dac41690b50e0068')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1

}
