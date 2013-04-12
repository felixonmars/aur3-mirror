# Maintainer: Unia <jthidskes@outlook.com> 

pkgname=gstopwatch-git
_gitname=gstopwatch
pkgver=2013.04.12
pkgrel=1
pkgdesc="A simple stopwatch, written in GTK3"
arch=('i686' 'x86_64')
url="https://github.com/Unia/gstopwatch"
license=('GPL2')
depends=('gtk3')
makedepends=('git')
source=('git://github.com/Unia/gstopwatch.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
