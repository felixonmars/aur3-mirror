# Maintainer: Stéphane Marguet (Stemp) <smarguet @ gmail dot com>

pkgname=ttf-ringbearer
pkgver=1.0
pkgrel=1
pkgdesc="The font from the Lord of the Rings title logo"
arch=('any')
changelog=ChangeLog
url="http://www.thehutt.de/tolkien/fonts.html"
license=('Free for personal use')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(http://www.thehutt.de/tolkien/fonts/ringbearer.zip)
md5sums=('fa8f3f0b656e043bc8c350a84587b901')

package()
{
  cd "$srcdir"
  install -d $pkgdir/usr/share/fonts/TTF/ 
  install -m644 RINGM___.TTF $pkgdir/usr/share/fonts/TTF/ringbearer.ttf
}