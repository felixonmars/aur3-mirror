# Maintainer: Patryk Kowalczyk < patryk at kowalczyk dot ws>

pkgname=ocaml-libvirt
pkgver=0.6.1.2.12.g31ce6b2
pkgrel=1
license=('GPL')
arch=('i686' 'x86_64')
pkgdesc="Objective Caml (OCaml) bindings for libvirt"
url="http://libvirt.org/ocaml/"
depends=('ocaml')
makedepends=('ocaml-findlib')
source=("git://git.annexia.org/git/ocaml-libvirt.git"
	"ocaml-libvirt01.patch")
options=('!strip')
_gitname=ocaml-libvirt
BUILDENV=(!fakeroot !distcc color !ccache)

pkgver() {
  cd  "${srcdir}/${_gitname}"
 git describe --always | sed 's|-|.|g'
}

build() {
  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  cd "${srcdir}/${pkgname}"
	#patch -p1 < ../ocaml-libvirt01.patch
  autoconf
  ./configure --prefix=/usr
  make all opt doc
}

package () {
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  cd "${srcdir}/${pkgname}"
  mkdir -p "$OCAMLFIND_DESTDIR"
  make OCAMLFIND_DESTDIR=$OCAMLFIND_DESTDIR install-opt 
  install -Dm 644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING 
}

md5sums=('SKIP'
         '1421d085ae4a0b4b3fa8520ac646d8cd')

