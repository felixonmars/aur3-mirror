# Maintainer: ?

_pkgname=zlauncher
pkgname=$_pkgname-git
pkgver=22.e220576
pkgrel=1
pkgdesc="A GTK based customisable menu like launcher written in Vala."
url="https://github.com/zeromancer/zlauncher"
arch=('any')
depends=('gtk3')
makedepends=('gcc' 'make' 'pkgconfig' 'git' 'vala')
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git://github.com/zeromancer/zlauncher.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  make || return 1
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" PREFIX="usr" install
}

