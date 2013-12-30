# submitter: perlawk
# Maintainer: perlawk

pkgname=unm-scheme
pkgver=1.0
pkgrel=2
pkgdesc="UNM Scheme is an implementation of the Scheme programming language written by yours truly to serve as the interface for an image processing library."
url="http://www.cs.unm.edu/~williams/unmscheme.html"
arch=('x86_64' 'i686')
license=('customize')
depends=('mesa')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=unmscheme.install
prg=unmscheme
home=/usr/share/$prg
source=("http://www.cs.unm.edu/~williams/${prg}.tar.gz"
"unmscheme.patch"
)
 
build() {
  cd "${srcdir}/${prg}"
	patch < "$startdir"/unmscheme.patch
 	gcc -o $prg $prg.c -O3 -lm -lglut -lGL -lGLU
}
 
package() {
  cd "${srcdir}/$prg"
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/$home
	cp "$prg" "$pkgdir"/usr/bin
	cp *.scm  "$pkgdir"/$home
}
md5sums=('c789142a6a27ad5103b28f9f7c3ad5c8'
         '61d49305c55c65826461149dbb29558f')
