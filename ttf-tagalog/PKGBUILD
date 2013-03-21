# Contributor: David Mikalova <dmikalova@gmail.com>

pkgname=ttf-tagalog
pkgver=1
pkgrel=1
pkgdesc="Tagalog stylized font which includes Baybayin font."
url="http://www.mts.net/~pmorrow/fonts.htm"
license=('unknown')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("http://www.mts.net/~pmorrow/tagstyle.zip")
md5sums=('fab97f519194f70ff56d3d89b8b6b3ec')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp "$srcdir/TagStyle.ttf" "$pkgdir/usr/share/fonts/TTF/TagStyle.ttf"
}