#Contributor: Massimiliano Brocchini <brocchini@netseven.it>

pkgname=glcaml
pkgver=20080215a
pkgrel=2
pkgdesc="OpenGL (1.1-2.1)/SDL bindings for Objective Caml (OCaml)"
arch=('i686' 'x86_64')
url="http://glcaml.sourceforge.net/"
license=('BSD' 'LGPL')
depends=('ocaml' 'sdl' 'mesa')
source=(http://downloads.sourceforge.net/glcaml/$pkgname.$pkgver.tar.gz)
md5sums=('76dc4d2901830c1ae96d2f23b2bd7b18')

build() {
  cd ${srcdir}/${pkgname}
  make || return 1
  mkdir -p ${pkgdir}/usr/lib/ocaml/glcaml
  "rm" install.txt makefile makefile.inc OCamlMakefile
  mkdir -p ${pkgdir}/usr/share/licenses/glcaml
  "mv" licence.txt ${pkgdir}/usr/share/licenses/glcaml/
  mkdir -p  ${pkgdir}/usr/lib/ocaml/glcaml/{bin,doc,examples,glgen,lib}
  for i in bin doc examples glgen lib; do
    # Copy manually (instead of 'install'), because of sub-directories
    cp -R $i/* ${pkgdir}/usr/lib/ocaml/glcaml/$i/
    chmod -R 0644 ${pkgdir}/usr/lib/ocaml/glcaml/$i/
  done
}
