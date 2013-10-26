# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

# XXX: Build will fail if old headers are present on the system.
# XXX: You have to uninstall libquvi in order to build this.

pkgname=libquvi-git
pkgver=v0.9.3.13.g8f43c14
pkgrel=1
pkgdesc='Cross-platform library for parsing flash media stream URLs. (GIT version)'
arch=('i686' 'x86_64')
url="http://quvi.sourceforge.net/"
license=('AGPL3')
depends=('libquvi-scripts-git' 'curl' 'lua' 'libproxy' 'libgcrypt' 'glib2')
makedepends=('git' 'asciidoc')
provides=('libquvi')
conflicts=('libquvi')
options=('!libtool')
source=('git://repo.or.cz/libquvi.git#branch=next')
_gitname="libquvi"
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo "$(git describe --always | tr - .)"
}

build() {
  cd "${_gitname}"

  ./bootstrap.sh

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd "${_gitname}"

  make DESTDIR="${pkgdir}" install
}

