# Contributor: Rogof <fake.bios(at)gmail(dot)com>

pkgname=prime
pkgver=1.0.0.1
pkgrel=3
pkgdesc="Japanese PRIME IMEngine"
arch=("i686" "x86_64")
url="http://taiyaki.org/prime/"
license=('GPL2')
depends=('suikyo' 'ruby' 'ruby-sary')
optdepends=('ruby-progressbar')
options=('!libtool')
source=(http://prime.sourceforge.jp/src/$pkgname-$pkgver.tar.gz)
md5sums=('c3bb6df8590986104e41c23330d90aef')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var|| return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  make DESTDIR=$pkgdir install-etc || return 1
}
