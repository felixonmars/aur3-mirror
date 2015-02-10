# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

pkgname=yosys-git
_pkgbasename=yosys
pkgver=0.5+2.a779a09
pkgrel=2
epoch=1
pkgdesc="A framework for Verilog RTL synthesis with extensive Verilog-2005 support"
arch=('i686' 'x86_64')
url="http://www.clifford.at/yosys/"
license=('custom:ISC')
depends=('tcl' 'graphviz')
makedepends=('git' 'mercurial' 'libffi')
source=(git+https://github.com/cliffordwolf/yosys.git
        yosys-Makefile-Arch-Linux.patch
        license.txt)
sha256sums=('SKIP'
            '9d6bb8244a05df7ddd42c251eb7ac3e75189a6dab48c569963638c99fef9bbac'
            'e09c086c53f9cc8ebecc207ae7d854f544e26f89baf65c002b7471313cde02b8')

pkgver() {
  cd "${srcdir}/${_pkgbasename}"

  printf "%s.%s"  "$(make echo-yosys-ver)" \
                  "$(make echo-git-rev)"
}

prepare() {
  cd "${srcdir}/${_pkgbasename}"

  patch -Np1 -i "${srcdir}/yosys-Makefile-Arch-Linux.patch"
}

build() {
  cd "${srcdir}/${_pkgbasename}"

  make
}

package() {
  cd "${srcdir}/${_pkgbasename}"

  install -d "${pkgdir}/usr/bin"

  make DESTDIR="${pkgdir}/usr" install

  install -D -m 644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/yosys-git/license.txt"
}

# vim: set ts=2 sw=2 ft=sh noet:
