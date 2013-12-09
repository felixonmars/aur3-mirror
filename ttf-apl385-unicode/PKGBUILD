# Maintainer: Evan Hanson <evan@thunktastic.com>
pkgname=ttf-apl385-unicode
pkgver=0.1
pkgrel=2
filename=apl385.ttf
url="http://misc.aplteam.com/${filename}"
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Adrian Smith's APL385 Unicode font"
license=('Public Domain')
arch=('any')
md5sums=('0f127d59bbed2766e2f8d14ca320404a')
source=("http://misc.aplteam.com/${filename}")
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
