# Contributor: bender02 at gmx dot com
pkgname=glickomania
pkgver=1.0
pkgrel=1
pkgdesc="A block-destroying puzzle game"
arch=('i686' 'x86_64')
url="http://hibase.cs.hut.fi/~cessu/glickomania"
license=("GPL2")
depends=(gtk)
source=(http://hibase.cs.hut.fi/~cessu/glickomania/$pkgname-$pkgver.tar.gz)
md5sums=('4e6dec9aec61a7bd313d6ceb20376fa6')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
