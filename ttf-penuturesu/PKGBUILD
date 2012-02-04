pkgname=ttf-penuturesu
pkgver=1.0
pkgrel=1
pkgdesc="Unicode TrueType font for Linear B"
arch=('any')
url="http://www.i18nguy.com/unicode/unicode-font.html"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(http://www.i18nguy.com/unicode/penuture.zip LICENSE)
md5sums=('84fc8b9b7caf396c5041b3d1f7e64a36'
         '334b86ab2dd78ca14823c03d25d2151c')
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/PENUTURE.TTF $pkgdir/usr/share/fonts/TTF/penuture.ttf
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

