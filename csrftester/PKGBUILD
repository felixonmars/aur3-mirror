# Maintainer: Bart Verhoeven <nepherte at archlinux dot us>

pkgname=csrftester
_name=CSRFTester
pkgver=1.0
pkgrel=1
pkgdesc="Testing tool for CSRF flaws"
arch=('i686' 'x86_64')
url="http://www.owasp.org/index.php/Category:OWASP_CSRFTester_Project"
license=('LGPL')
depends=('java-runtime')
source=(http://www.owasp.org/images/0/08/$_name-$pkgver.zip
        csrftester.sh)
md5sums=('f2ff031c3db7a1fe005700766bf3fc98'
         '96ff5c41412a427a4004271ce2684c15')

build() {
  mkdir -p $pkgdir/usr/share/$pkgname
  mkdir -p $pkgdir/usr/bin
  cp -r $srcdir/$_name-$pkgver/* $pkgdir/usr/share/$pkgname
  install -m 755 $srcdir/csrftester.sh $pkgdir/usr/bin/$pkgname
  rm $pkgdir/usr/share/$pkgname/run.bat
}

# vim:set ts=2 sw=2 et:
