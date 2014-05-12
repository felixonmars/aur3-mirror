# Maintainer: Ben Bristow <me@benbristow.co.uk>
pkgname=evolve-git
pkgver=.35
pkgrel=1
pkgdesc="Vectorizes images throught evolution of a DNA sequence."
arch=('any')
url="https://github.com/tux3/Evolve"
license=('MIT')
makedepends=('git' 'qt5-base' 'qt5-svg')
source=('git://github.com/tux3/Evolve.git')
md5sums=('SKIP')

build() {
  cd Evolve
  qmake
  make
}

package() {
  cd Evolve
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp Evolve $pkgdir/usr/bin/evolve
}
