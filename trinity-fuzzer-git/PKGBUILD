# Maintainer: Boohbah <boohbah at gmail.com>

pkgname=trinity-fuzzer-git
_gitname=trinity
pkgver=1.1.234.ge7246b9
pkgrel=1
pkgdesc="A Linux System call fuzz tester"
arch=('i686' 'x86_64')
url="http://codemonkey.org.uk/projects/trinity/"
license=('GPL')
makedepends=('git')
conflicts=('trinity-fuzzer')
source=('git://git.codemonkey.org.uk/trinity')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  ./configure.sh
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
