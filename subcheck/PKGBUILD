
# Maintainer: Sven Wick <sven DOT wick AT gmx DOT de>

pkgname=subcheck
pkgver=0.78.2
pkgrel=1
pkgdesc="checks srt (SubRip) subtitle files for errors"
arch=('any')
url="http://subcheck.sourceforge.net"
license=('GPL')
depends=('perl')
source=($pkgname-$pkgver.tar.gz subdircheck.sh)
md5sums=('1aa389fe6531a75602f53b90ff691815' 'd8a824e6d0a819944c983be3d8caeb73')

package() {

  install -d "$pkgdir/usr/bin"
  install "$srcdir/$pkgname/subcheck.pl" "$pkgdir/usr/bin/subcheck"
  install "$srcdir/subdircheck.sh" "$pkgdir/usr/bin/subdircheck"

}

