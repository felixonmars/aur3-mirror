# Maintainer: Jonas Höglund <firefly＠firefly.nu>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
pkgname=pangoterm-bzr
pkgver=r559
pkgrel=1
pkgdesc="GTK/Pango-based terminal emulator using the libvterm library"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/pangoterm"
license=('MIT')
depends=('pangoterm-libvterm-bzr' 'pango')
makedepends=('bzr')
provides=('pangoterm')
source=("${pkgname}::bzr+http://bazaar.leonerd.org.uk/code/pangoterm/")
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
