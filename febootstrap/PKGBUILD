# Maintainer: Thomas S Hatch <thatch45 (at) Gmail (dot) com>

pkgname=febootstrap
pkgver=3.21
pkgrel=1
license=('GPL2')
arch=('i686' 'x86_64')
pkgdesc="Tool used to create libguestfs supermin appliances"
url="http://people.redhat.com/~rjones/febootstrap/"
depends=('wget' 'cpio')
makedepends=('ocaml' 'ocaml-findlib')
source=("http://people.redhat.com/~rjones/${pkgname}/files/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e9ec3d9f6dbf60e4f8939cfb6d84303899f64a743bb03baccc86452fcf4da0887834ee628d671532521adab6971aa92af6674ab6b2f87a26324a50f75f55e2e8')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make -k check
}

package () {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
