# Maintainer: delta48

pkgname=ksokoban
pkgver=0.5.0
pkgrel=1
pkgdesc="A type of transport puzzle, in which the player pushes boxes or crates around in a warehouse, trying to get them to storage locations."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ksokoban/"
license=('custom')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'mercurial')
source=('ksokoban-code::hg+http://hg.code.sf.net/p/ksokoban/code')
md5sums=('SKIP')


build() {
  cd "$srcdir/ksokoban-code"
  cmake .
  make
}

package() {
  cd "$srcdir/ksokoban-code"
  install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
}
