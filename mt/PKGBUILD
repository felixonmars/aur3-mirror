# Contributor:  <youremail@domain.com>
pkgname=mt
pkgver=.1
pkgrel=2
pkgdesc="A simple, multi-tabbed terminal."
arch=('i686' 'x86_64')
url="http://github.com/mutantturkey/mt"
license=('GPL')
depends=('gtk2' 'vte')
source=($pkgname-$pkgver.tar.gz)
md5sums=('82098979c66b25b84c5ac738e5d8a3ea') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
