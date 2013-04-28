# Maintainer: Jérémie Astor <astor.jeremie@wanadoo.fr>
pkgname=tfwm
pkgver=0
pkgrel=6
epoch=
pkgdesc="Tiny Floating WM"
arch=(any)
url="http://sourceforge.net/projects/tfwm"
license=('GPL')
groups=()
depends=('libx11')
source=(http://downloads.sourceforge.net/$pkgname/sources/$pkgname-$pkgver.$pkgrel.tar.gz)

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir/" install
}
md5sums=('e75cb785d830262c72fdb55ee3055255')
