# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>

pkgname=zenburn-tetris-git
pkgver=r16.73f2962
pkgrel=1
pkgdesc="Tetris clone written in C using OpenGL and SDL."
arch=('i686' 'x86_64')
url="https://github.com/alexeyden/Tetris-Game"
license=('MIT')
depends=('sdl' 'glu' 'libgl')
makedepends=('git' 'mesa')
source=(zenburn-tetris::"git+https://github.com/alexeyden/Tetris-Game.git")
md5sums=('SKIP')

pkgver() {
  cd zenburn-tetris
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # add libm and our cflags
  sed 's|^FLAGS=.*-lGLU$|& -lm ${CFLAGS}|' -i zenburn-tetris/Makefile
}

build() {
  make -C zenburn-tetris prefix="/usr"
}

package() {
  cd zenburn-tetris
  make prefix="$pkgdir/usr" install
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
