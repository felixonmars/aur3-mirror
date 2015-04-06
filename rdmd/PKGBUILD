# Maintainer: Fabrizio Pelosi <tesfabpel@gmail.com>
# Previous Maintainer: Josh Netterfield <joshua@nettek.ca>
pkgname=rdmd
_branch_or_commit=7981c5e697cb83d1f3df48c926cfa55a86f45a65
pkgver=2.067.0.7981c5e
pkgrel=1
pkgdesc="Builds (with dependants) and runs a D program."
url="http://www.dlang.org"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('dmd' 'libphobos-devel')
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=("https://raw.githubusercontent.com/D-Programming-Language/tools/${_branch_or_commit}/rdmd.d")
md5sums=('SKIP')

build() {
  cd "${srcdir}"
  dmd ../rdmd.d
}

package() {
  cd "${srcdir}"
  
  mkdir -p "$pkgdir/usr/bin/"
  install -m755 rdmd "$pkgdir/usr/bin/rdmd"
}

# vim:set ts=2 sw=2 et:
