# Contributor: Marq Schneider <queueRAM@gmail.com>

pkgname=masterm
pkgver=1.1.1b
pkgrel=3
pkgdesc="simple terminal mastermind game"
arch=('i686' 'x86_64')
url="https://github.com/jstitch/masterm"
license=('GPL')
depends=('ncurses')
makedepends=('git')
source=("$pkgname"::'git+https://github.com/jstitch/masterm.git#commit=a3c08a4560')
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"

  # build the colorblind supported version of the game
  make colorblind
}

package() {
  cd "${srcdir}/${pkgname}"

  install -D masterm "${pkgdir}/usr/bin/masterm"
}

# vim:set ts=2 sw=2 et:
