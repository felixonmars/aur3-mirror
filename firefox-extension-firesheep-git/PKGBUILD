# Maintainer: -
pkgname=firefox-extension-firesheep-git
pkgver=1.5.gcbc0579
pkgrel=1
pkgdesc="A Firefox extension that demonstrates HTTP session hijacking attacks (Git)"
arch=('i686' 'x86_64')
url="https://github.com/codebutler/firesheep"
license=('GPL')
options=(!makeflags)
depends=('firefox')
makedepends=('git')
conflicts=('firesheep-git')
source=('git://github.com/codebutler/firesheep.git')
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
