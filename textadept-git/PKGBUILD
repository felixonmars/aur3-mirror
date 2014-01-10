# Maintainer: brainrape <martonboros at gmail dot com>

pkgname=textadept-git
_gitname=textadept
pkgver=7.2_alpha
pkgrel=1
pkgdesc="fast, minimalist, extensible text editor for programmers"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/rgieseke/textadept"
license=('MIT')
depends=()
makedepends=('git')
source=("git://github.com/rgieseke/textadept.git")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_gitname}"
    git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname/src"
  make deps
  make
  make curses
}

package() {
  cd "$srcdir/$_gitname/src"
  make PREFIX="$pkgdir/usr" install
}
