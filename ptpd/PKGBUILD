# Maintainer: Ansgar Taflinski <ataflinski@uni-koblenz.de>
pkgname=ptpd
pkgver=1.1.0
pkgrel=3
pkgdesc="PTPd is an implementation of the IEEE1588-2002 PTP specification"
arch=('i686' 'x86_64')
url="http://ptpd.sourceforge.net/"
license=('BSD')
makedepends=('make' 'binutils' 'gcc')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz ptpd.service)
noextract=()
md5sums=('faa4823576dd49ccc94b741ff32b03f5'
         'aed280137d750120d84e88c50884bd9b')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make
}

package() {
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  install -m 644 -o root -g root "$srcdir/ptpd.service" "$pkgdir/usr/lib/systemd/system/"
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 -o root -g root "$srcdir/$pkgname-$pkgver/src/ptpd" "$pkgdir/usr/bin/"  
}
