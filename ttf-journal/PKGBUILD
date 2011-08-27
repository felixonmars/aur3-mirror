pkgname=ttf-journal
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
license=('GPLv2')
pkgdesc="Journal true type font"
arch=('any')
url="http://www.maknyos.com/z5x761nx04es/journal-maknyos.com.zip.html"
source=(http://pd7.premium.maknyos.com/files/1/lp6x3udn33ohps/journal-maknyos.com.zip)
md5sums=('6da015787d50ace46debab84e2771226')
install=$pkgname.install

build()
{
  mkdir -p $startdir/src/$pkgname/
  cd $startdir/src/$pkgname/
  mkdir -p $startdir/pkg/usr/share/fonts/TTF
  cp $srcdir/JOURNAL.TTF $pkgdir/usr/share/fonts/TTF
}
