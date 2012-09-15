# Maintainer: Feufochmar < feufochmar . gd & gmail . com >
pkgname=guile-tcod
pkgver=v0.1
pkgrel=1
pkgdesc="A guile module for libtcod."
arch=('i686' 'x86_64')
url="http://gitorious.org/guile-tcod/guile-tcod"
license=('LGPL')
depends=('libtcod' 'guile>=2.0')
source=(http://gitorious.org/$pkgname/$pkgname/archive-tarball/$pkgver)
noextract=()
md5sums=('1b990d0d51c91cf8e7d5199dfb456457')

build() {
  cd "$srcdir/$pkgname-$pkgname"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgname"
}

package() {
  cd "$srcdir/$pkgname-$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
