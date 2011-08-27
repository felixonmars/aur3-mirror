# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=galactic-turtle
pkgver=1.1.1
pkgrel=3
pkgdesc="A CLI multi-player network game, similar to Galactic Conquest"
arch=('i686' 'x86_64')
url="http://github.com/foutrelis/galactic-turtle"
license=('GPL3')
depends=('sqlite3')
source=(http://cloud.github.com/downloads/foutrelis/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('af9c3cebae271bb4d7e5d4bacf1c380d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
