# Maintainer: Geoffrey Sneddon <me@gsnedders.com>

pkgname=compcert-git
pkgrel=1
pkgver=r1154.3c6f534
pkgdesc="The verified C compiler."
arch=('i686' 'x86_64')
url="http://compcert.inria.fr/compcert-C.html"
license=('custom')
depends=('glibc')
makedepends=('git' 'coq' 'ocaml' 'ocaml-menhir' 'lib32-glibc')
source=('git+https://github.com/AbsInt/CompCert.git')
md5sums=('SKIP')

pkgver() {
  cd CompCert
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd CompCert
  ./configure -prefix /usr ia32-linux
  make
}

package() {
  cd CompCert
  make PREFIX="$pkgdir/usr" install
  chmod 644 $pkgdir/usr/lib/compcert/libcompcert.a
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
