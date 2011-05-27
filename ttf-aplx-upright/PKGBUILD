# Maintainer: Evan Hanson <evan@thunktastic.com>
pkgname=ttf-aplx-upright
pkgver=0.1
pkgrel=1
filename=aplx_unicode.ttf
url="http://www.vector.org.uk/resource/$filename"
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="MicroAPL's APLX Upright Unicode font"
license=('Public Domain')
arch=('any')
md5sums=('4d19698edd00dba90603f2a1c2cd05e9')
source=(http://www.microapl.co.uk/download/$filename)
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
