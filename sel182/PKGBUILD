# Maintainer: Florian Hahn <flo@fhahn.com>

pkgname=sel182
pkgver=4.14.2
pkgrel=2
pkgdesc="Sequencer/event counter library used by the systems programming course at the Technical University Vienna"
arch=('i686' 'x86_64')
url="https://github.com/osue-tuwien/SE"
license=('unknown')
makedepends=('cmake')
source=(https://github.com/osue-tuwien/SE/tarball/v$pkgver)
md5sums=('2be9dfe31e36b60c03d6e43ffbe35f7c') #generate with 'makepkg -g'
options=('staticlibs')


build() {
  cd "${srcdir}/`ls | grep SE`"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/`ls | grep SE`"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
