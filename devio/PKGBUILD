# Contributor: Jick Nan <jick.nan@gmail.com>
pkgname=devio
pkgver=1.2
pkgrel=2
pkgdesc="devio writes directly into the object rather than reading and writing
a stream of data."
arch=(i686 x86_64)
url="http://devio.sourceforge.net/"
license=('GPL')
depends=()
makedepends=()
install=
source=(http://downloads.sourceforge.net/sourceforge/devio/$pkgname-$pkgver.tar.gz)
md5sums=('5d332c2bffc0791367bcf3368ba1a0d1') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
