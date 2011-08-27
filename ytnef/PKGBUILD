# Contributor: Andre Klitzing <aklitzing () online () de>
pkgname=ytnef
pkgver=2.6
pkgrel=1
pkgdesc="Yerase's TNEF Stream Reader cmd-line (decode winmail.dat)"
arch=(i686 x86_64)
url="http://ytnef.sourceforge.net/"
license=('GPL')
depends=('libytnef')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('572830ff0664a2abc3e7aea79040c338')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install
}

