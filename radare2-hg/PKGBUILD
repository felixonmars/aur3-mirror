pkgname="radare2-hg"
pkgver=9999
pkgrel=1
pkgdesc="A collection of tools with the aim to create a complete, portable, multi-architecture, unix-like toolchain for reverse engineering."
arch=('i686' 'x86_64')
url="http://radare.org"
license=('GPL3')
depends=('vala' 'valabind-hg')
makedepends=('mercurial')
provides=('radare2' 'r2-bindings')
conflicts=('radare2' 'r2-bindings')

_hgroot="http://radare.org/hg"
_hgrepo="radare2"

build() {
  msg "This packages it deprecated, since the project moved to github."
  msg "Install radare2-git instead."
}

package() {
  return 1
}
