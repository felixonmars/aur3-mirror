# Maintainer: kevku <kevku@gmx.com>
pkgname=yencode
pkgver=0.46
pkgrel=1
pkgdesc="yEnc encoder and decoder"
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/yencode/"
license=('GPL2')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/yencode/yencode/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('6af054f69c781cafa620063878a831ea')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
