# Contributor: Your Name <youremail@domain.com>

pkgname=libgraph
pkgver=1.0.2
pkgrel=1
pkgdesc="libgraph is an implementation of the TurboC graphics API (graphics.h) on GNU/Linux using SDL"
url="http://savannah.nongnu.org/projects/libgraph"
arch=('i686' 'x86_64')
license=('GPL')
groups=()
depends=(sdl_image guile)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz libgraph.patch)
noextract=()
md5sums=('6093bf0a9a65a5b873836276c9954194'
         'a45052d1622608925a5db315b277c12c')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i ../libgraph.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
