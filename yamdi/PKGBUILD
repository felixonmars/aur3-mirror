pkgname=yamdi
pkgver=1.8
pkgrel=1
pkgdesc="A metadata injector for FLV files"
arch=('i686' 'x86_64')
url="http://yamdi.sourceforge.net/"
license=('BSD')
depends=('glibc')
source=(http://downloads.sourceforge.net/yamdi/$pkgname-$pkgver.tar.gz)
md5sums=('7562f6e28247013cd09e62c4c91272d5') 

build() {
  cd $srcdir/$pkgname-$pkgver
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/{bin,share/man/man1}
  install -m 0755 -o root yamdi $pkgdir/usr/bin/
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 man1/yamdi.1 $pkgdir/usr/share/man/man1/yamdi.1
}

# vim:set ts=2 sw=2 et:
