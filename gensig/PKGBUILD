pkgname=gensig
pkgver=2.3
pkgrel=3
pkgdesc="an automatic random .signature generator"
arch=(i686 x86_64)
url="http://www.ooblick.com/software/gensig/"
license=('GPL')
depends=('glibc')
source=(http://www.ooblick.com/software/gensig/$pkgname-$pkgver.tar.gz)
md5sums=('1b4a0b3713b8e377baeef606f584d539')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
