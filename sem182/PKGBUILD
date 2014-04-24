# Maintainer: Florian Hahn <flo@fhahn.com>

pkgname=sem182
pkgver=2.4.2
pkgrel=2
pkgdesc="Semaphore library used by the operating systems programming course (OSUE) at the Technical University Vienna"
arch=('i686' 'x86_64')
url="https://github.com/osue-tuwien/sem182"
license=('unknown')
makedepends=('cmake')
source=(https://github.com/osue-tuwien/$pkgname/tarball/v$pkgver)
md5sums=('d6cd6edc0ed8e349161a3c9c97d4aabd') #generate with 'makepkg -g'
options=('staticlibs')


build() {
  cd "${srcdir}/`ls | grep ${pkgname}`"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/`ls | grep ${pkgname}`"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
