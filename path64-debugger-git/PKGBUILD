# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=path64-debugger-git
pkgver=122.d46ff57
pkgrel=1
pkgdesc="PathScale debugger"
arch=('x86_64')
url="http://www.path64.org/"
license=('CDDL')
depends=('gcc-libs' 'ncurses')
makedepends=('git')
source=('debugger::git+git://github.com/path64/debugger.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/debugger"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/debugger"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/debugger"
  make DESTDIR="$pkgdir/" install
} 
