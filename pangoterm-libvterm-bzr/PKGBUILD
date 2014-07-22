# Maintainer: Jonas Höglund <firefly＠firefly.nu>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname=pangoterm-libvterm-bzr
pkgver=r617
pkgrel=1
pkgdesc="An abstract library implementation of a VT220/xterm/ECMA-48 terminal emulator, not to be confused with the other package called 'libvterm'."
arch=('i686' 'x86_64')
url="https://launchpad.net/libvterm"
license=('mit')
depends=()
makedepends=('bzr')
provides=('pangoterm-libvterm')
source=("${pkgname}::bzr+lp:libvterm")
md5sums=('SKIP')

pkgver () {
  cd "${pkgname}"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "${pkgname}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
