# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
_name=immio
pkgname="${_name}-git"
pkgver=34.dbe9ed9
pkgrel=1
pkgdesc="A command-line image uploader"
arch=('i686' 'x86_64')
url="https://github.com/HalosGhost/${_name}"
license=('CCPL:BY-SA')
depends=('curl')
makedepends=('git')
source=("${_name}::${url//https/git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  echo "$(git rev-list --count HEAD).$(git describe --always )"
}

prepare() {
  cd "${_name}"
  make
}

package() {
  cd "${_name}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
