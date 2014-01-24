# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=ttf-greyscale-basic
_realname=GreyscaleBasic
pkgver=2
pkgrel=1
pkgdesc="Greyscale Basic True Type Font by: Greyscale"
arch=('any')
license=('custom:free')
url="http://www.greyscale.net/basic"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("$url/$_realname.zip" "http://www.greyscale.net/basic/index.html")

md5sums=('f0ea410d0130e969d5cc79e9e951b0e5'
         '9d4fa006116eff349a2ca8d5c866a2c0')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 GreyscaleBasic/*.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  install -Dm644 *.html $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
