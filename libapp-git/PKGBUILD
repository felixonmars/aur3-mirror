# See AUR interface for current maintainer.

pkgname=libapp-git
pkgver=20140527.r52
pkgrel=1
pkgdesc="Utilities for repetitive tasks in app development"
arch=('i686' 'x86_64')
url="https://github.com/drotiro/libapp"
license=('LGPL3')
makedepends=('git')
provides=('libapp')
source=("libapp-git::git://github.com/drotiro/libapp.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf %s.r%s \
    $(git log -1 --format="%cd" --date=short | sed 's/-//g') \
    $(git rev-list --count HEAD)
    # $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"

  #mkdir -p "$pkgdir/usr/include"
  #mkdir -p "$pkgdir/usr/lib"
  make PREFIX="$pkgdir/usr/" install
} 
