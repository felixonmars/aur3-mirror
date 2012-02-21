# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname="caml2html"
pkgver=1.4.1
pkgrel=6
pkgdesc="A tool to generate colorized html source from OCaml source code, and much more : LaTeX output, type display on hovering... (standalone binary + OCaml library)"
arch=('i686' 'x86_64')
url="http://martin.jambon.free.fr/caml2html.html"
license=('GPL')
depends=('ocaml')
makedepends=(xc'ocaml-findlib')
conflicts=("${pkgname}-full")
provides=("${pkgname}-full")
options=('!strip')
source=("http://martin.jambon.free.fr/${pkgname}-$pkgver.tar.bz2"
	'caml2html.1.gz')
md5sums=('cecc0b3191a99611609a0fb1957c15b6'
         '9286b5894e7f2b3ad1156f31b0cc2ff1')
noextract=('caml2html.1.gz')


build() {
  cd "$srcdir/${pkgname}-$pkgver"

  # making both binary and lib
  # see `caml2html' for the standalone binary
  PREFIX=/usr make caml2html bytelib optlib
  
  # fix a version number that hasn't been updated
  sed -i -e "s/1.3.1/1.4.1/" META
 
  # add `|| true' to prevent make from exiting with error code 1
  sed -i -e '38c\
	test -f caml2html.cma -o -f caml2html.cmxa && $(MAKE) libinstall || true' Makefile

  # change default path for findlib
  sed -i -e "s#ocamlfind install#ocamlfind install -destdir $pkgdir$(ocamlfind printconf destdir)#g" Makefile
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  
  # creating the structure to contain files
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
  
  PREFIX="$pkgdir/usr" make install 

  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/man/man1"
  install -m 0644 caml2html.1.gz "$pkgdir/usr/share/man/man1"
}
