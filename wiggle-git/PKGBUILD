# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>
pkgname=wiggle-git
pkgver=r279.eac35c0
pkgrel=1
pkgdesc="A program for applying patches that patch cannot apply because of conflicting changes"
arch=('i686' 'x86_64')
depends=('ncurses')
url="https://github.com/neilbrown/wiggle"
license=('GPL2')
source=($pkgname::git://github.com/neilbrown/wiggle.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}

