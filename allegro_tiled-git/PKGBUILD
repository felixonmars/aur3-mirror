pkgname=allegro_tiled-git
_gitname=allegro_tiled
pkgver=5.1.7aadff6
pkgrel=1
pkgdesc='Tiled support for allegro'
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.vim.org"
depends=('allegro-git')
makedepends=('cmake')
conflicts=('allegro_tiled')
provides=('allegro_tiled=5.1')
source=("git+https://github.com/belak/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo 5.1.$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=true \
    -DWANT_EXAMPLE=false
  make
}

package() {
  cd $_gitname
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
