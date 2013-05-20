# Maintainer: Unia <jthidskes@outlook.com> 

pkgname=gtimeutils-git
_gitname=gtimeutils
pkgver=2013.05.07
pkgrel=1
pkgdesc="A simple stopwatch and timer, written in GTK. GTK3 version."
arch=('i686' 'x86_64')
url="https://github.com/Unia/gtimeutils"
license=('GPL2')
depends=('gtk3' 'libnotify' 'libcanberra')
makedepends=('git')
source=('git://github.com/Unia/gtimeutils.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
  cd $_gitname
  make all
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
