# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: redpunk <redpunk231@gmail.com>

_pkgname=deadbeef-qt
pkgname=deadbeef-qt-git
pkgver=r6.dfeb647
pkgrel=1
pkgdesc='Qt based user interface plugin for DeaDBeeF music player.'
url='https://github.com/redpunk231/deadbeef-qt'
license=('GPL2')
arch=('i686' 'x86_64')
depends=('qt4' 'deadbeef')
makedepends=('cmake' 'git')
source=('git://github.com/redpunk231/deadbeef-qt.git')
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DARTWORK_ENABLED=false
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}
