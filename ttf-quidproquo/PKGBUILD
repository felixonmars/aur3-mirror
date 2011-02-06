# Original autor: David Kerkhoff url: http://www.dafont.com/david-kerkhoff.d2542
# Maintainer: masterkorp  <masterkorp@gmail.com>    irc: masterkorp at freenode.org
# Last edited: 25th January 2011

pkgname=ttf-quidproquo
pkgver=1.0
pkgrel=1
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="The Quid Pro Quo typefont from da font"
url="http://www.dafont.com/quid-pro-quo.font"
arch=('any')
source=(http://www.kiwilight.com/~masterkorp/misc/fonts/$pkgname.tar.bz2)
install=$pkgname.install
md5sums=('5ced3766b83e17a57641daaca6c408d2')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
