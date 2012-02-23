# Maintainer: woelfchen <wolf.wilke AT yahoo DOT de>
pkgname=ttf-registry-brk
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="TTF-Font Registry BRK"
url=(http://www.schriftarten-fonts.de/fonts/4170/registry_brk.html)
arch=('any')
source=(http://www.schriftarten-fonts.de/d/4170/registry_brk.zip)
install=$pkgname.install
md5sums=('068263e4debbd32b2e6f0f632e248299')
license=('custom')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  mkdir -p $pkgdir/usr/share/licenses
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.txt $pkgdir/usr/share/licenses/$pkgname
}

