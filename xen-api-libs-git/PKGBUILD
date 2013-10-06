# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=xen-api-libs-git
pkgver=0.5.2.140.g0409955
pkgver(){
  cd $pkgname
  git describe --tags --long |sed 's/-/./g;s:^master/::'
}
pkgrel=1
pkgdesc="Libs for xen-api"
arch=(x86_64 i686)
url="https://github.com/xapi-project/xen-api-libs"
license=('LGPL')
depends=(ocaml ocaml-findlib camlp5 ocaml-type-conv ocaml-getopt ocaml-xmlm xen blktap-git e2fsprogs ocaml-ounit ocaml-bitstring ocaml-lwt)
makedepends=('git')
source=($pkgname::git://github.com/xapi-project/xen-api-libs
        0001-hashtblext.patch)

prepare() {
  cd $pkgname
  sed -i 's/tds/_ tds/' rpc-light/pa_rpc.ml
  git am $srcdir/0001-hashtblext.patch
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=('SKIP'
         'c99b67351a63739124258b8465214238')
