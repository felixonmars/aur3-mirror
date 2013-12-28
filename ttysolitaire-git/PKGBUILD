# Maintainer: fzerorubigd <fzerorubigd at gmail>

pkgname=ttysolitaire-git
_gitname=tty-solitaire
pkgver=1ebbf06
pkgrel=1
pkgdesc="ncurses-based klondike solitaire game"
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('git' 'gcc' 'make')
url="https://github.com/mpereira/tty-solitaire"
license=('MIT')
source=(git+https://github.com/mpereira/tty-solitaire.git)
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname

  msg 'Building...'
  make
}

package() {
  cd $_gitname

  msg 'Installing...'
  mkdir -p ${pkgdir}/usr/bin
  install -D -m755 ttysolitaire "${pkgdir}/usr/bin/"
}
