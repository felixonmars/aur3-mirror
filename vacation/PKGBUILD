# Contributor: dale <dale@archlinux.org>

pkgname=vacation
pkgver=1.2.7.1
pkgrel=1
pkgdesc="an automatic mail-answering program"
arch=('i686' 'x86_64')
url="http://www.csamuel.org/software/vacation"
license=('GPL')
depends=('gdbm')
source=(http://downloads.sourceforge.net/project/vacation/vacation/$pkgver/vacation-$pkgver.tar.gz)
md5sums=('272df506a542c9c587de43b3f531a5ed')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -dm755 $pkgdir/usr/{bin,share/man/man1}
  make PREFIX=$pkgdir/usr MANDIR=$pkgdir/usr/share/man/man install
}
