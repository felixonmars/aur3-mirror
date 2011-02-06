# Maintainer: Marti Raudsepp <marti@juffo.org>
pkgname=ttf-sniglet
pkgver=1.0
pkgrel=1
url="http://www.theleagueofmoveabletype.com/fonts/2-sniglet"
pkgdesc="Sniglet rounded font by Haley Fiege"
depends=('fontconfig' 'xorg-font-utils')
license=('custom:OFL')
arch=('any')
source=(
  http://s3.amazonaws.com/theleague-production/fonts/sniglet.zip
  OFL.txt
  $pkgname.install
)
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  cp $srcdir/OFL.txt $pkgdir/usr/share/licenses/$pkgname
}
md5sums=('d5aea392a3fec57dd469cb2983a7cc0a'
         '6ed93967ff0dc6dd9c8d31c17f817a06'
         '9b51a44c21f5b1c521ff49a82eab5da9')
