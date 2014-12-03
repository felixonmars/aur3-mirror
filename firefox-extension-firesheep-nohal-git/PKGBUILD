# Maintainer: -
pkgname=firefox-extension-firesheep-nohal-git
pkgver=1.5.g0be55a7
pkgrel=1
pkgdesc="A Firefox extension that demonstrates HTTP session hijacking attacks (no HAL) (Git)"
arch=('i686' 'x86_64')
url="https://github.com/obilodeau/firesheep"
license=('GPL')
options=(!makeflags)
depends=('firefox')
makedepends=('git')
conflicts=('firesheep-git')
source=('git://github.com/obilodeau/firesheep.git')
md5sums=('SKIP')

pkgver() {
  cd firesheep
  echo $(grep -Po ':version>\K[^<]*' xpi/install.rdf).g$(git describe --always)
}

package() {
  cd firesheep/xpi

  # Vars
  emid=$(grep -Pom1 'id>\K[^<]*' install.rdf)
  destdir="$pkgdir"/usr/lib/firefox/browser/extensions/$emid/

  # Install
  install -d $destdir/
  cp -r * $destdir/
}
