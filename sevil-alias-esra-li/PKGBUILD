pkgname=ttf-sevil-alias-esra-li
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="custom fonts"
arch=('any')
url=(http://www.dafont.com/)
license="custom"
source=(http://img.dafont.com/dl/?f=sevil_alias_esra_li)
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
