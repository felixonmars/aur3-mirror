# Maintainer: Sietse van der Molen <sietse@vdmolen.eu>

pkgname=ttf-caviar_dreams
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="More geometric sans-serif love, Nymphont style."
arch=('any')
license=('custom:free')
url=('http://www.nymfont.com/2009/06/new-caviar-dreams-font.html')
source=($pkgname.zip::http://img.dafont.com/dl/?f=caviar_dreams)
install=$pkgname.install
md5sums=('0fc6ddd765d88d7e788dc9c2ad2be2ab')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
