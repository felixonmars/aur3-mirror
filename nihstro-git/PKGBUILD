# Maintainer: saneki <fake.saneki@gmail.com>
# boost is actually an optional makedepends, only used for compiling nihstro-assemble..
pkgname=nihstro-git
_pkgname=nihstro
pkgver=38.625b1e4
pkgrel=1
pkgdesc="3DS shader disassembler and shader binary parser"
arch=("i686" "x86_64")
url="https://github.com/neobrain/nihstro"
license=("Custom")
makedepends=(boost cmake git)
depends=(gcc-libs)
source=("git://github.com/neobrain/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
