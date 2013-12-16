# Maintainer: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgname=valadoc
pkgname=valadoc-git
pkgdesc="A documentation generator for generating API documentation from Vala source code based on libvala."
pkgver=r548.40e796b
pkgrel=1
arch=('i686' 'x86_64')
url="http://live.gnome.org/Valadoc"
source=("git://git.gnome.org/valadoc" "703688.patch")
license=('GPL')
options=('!libtool')
depends=('vala' 'libgee' 'graphviz')
makedepends=('git')
provides=("valadoc")
conflicts=("valadoc")
md5sums=('SKIP'
         '4cd250c0e42ceb6a6d87896ef21277b8')

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"

  [ "$(git rev-list --count HEAD)" -ge "546" ] && patch -p1 < ../703688.patch

  ./autogen.sh

  ./configure --prefix=/usr --enable-static=no

  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
