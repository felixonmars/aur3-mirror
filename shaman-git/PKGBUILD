# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
_name=shaman
pkgname="${_name}-git"
pkgver=207.ad34631
pkgrel=1
pkgdesc="A small, native C library and utility to fetch weather"
arch=('i686' 'x86_64')
url="https://github.com/HalosGhost/${_name}"
license=('GPL2')
depends=('curl' 'jansson')
makedepends=('git')
source=("${_name}::${url//https/git}.git")
sha256sums=('SKIP')

pkgver () {
  cd "${_name}"
  printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD )"
}

prepare () {
  cd "${_name}"
  ./autogen.sh
  ./configure --prefix='/usr'
}

build () {
  cd "${_name}"
  make
}

check () {
  cd "${_name}"
  make check
}

package () {
  cd "${_name}"
  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}"/usr/bin/suite
  rm -f "${pkgdir}"/usr/lib/libweather.la
}

# vim:set ts=2 sw=2 et:
