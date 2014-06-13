# -*- shell-script -*-
# Maintainer: Eric Schulte <eric.schulte@gmx.com>
# Contributor: Eric Schulte <eric.schulte@gmx.com>
pkgname=cil-git
pkgver=4089
pkgrel=1
pkgdesc="C Intermediate Language for C program analysis."
arch=('i686' 'x86_64')
url="http://kerneis.github.com/cil/"
license=('GPL')
depends=('ocaml>=3.08')
makedepends=('ocaml>=3.08' 'ocaml-findlib' 'git')
conflicts=('cil')
provides=('cil')
source=("$pkgname::git://git.code.sf.net/p/cil/code")
options=('!strip' 'staticlibs')
md5sums=('SKIP')

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

pkgver() {
  cd "$srcdir/repo"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}"
}
