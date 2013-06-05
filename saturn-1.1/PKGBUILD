# Maintainer: Christoph Haag <haagch@studi.informatik.uni-stuttgart.de>
pkgname=saturn-1.1
pkgver=1.1
pkgrel=1
pkgdesc="Precise and Scalable Software Analysis, legacy 1.1 version"
arch=('i686' 'x86_64')
url="http://saturn.stanford.edu/pages/downloadindex.html"
license=('custom')
#depends=()
makedepends=('ocaml' 'sudo')
provides=('saturn=1.1')
#conflicts=()
options=()
source=('http://saturn.stanford.edu/download/saturn-1.1.zip' 'cil-Makefile.in') 

build() {
  # doesn't work with more than one job
  unset MAKEFLAGS

  # http://stackoverflow.com/questions/13584629/ocaml-compile-error-usr-bin-ld-cannot-find-lstr
  if [ ! -e "/usr/lib/ocaml/libstr.a" ]
  then
    msg "SORRY! NEED TO DO sudo ln -s /usr/lib/ocaml/libcamlstr.a /usr/lib/ocaml/libstr.a"
    msg "MORE INFO: http://church.cs.virginia.edu/genprog/index.php/FAQ#I_get_the_error%3a_cil_file_.22is_not_a_compiled_interface.22._What_do_I_do.3F"
    sudo -p "your sudo password for \"ln -s /usr/lib/ocaml/libcamlstr.a /usr/lib/ocaml/libstr.a\":" ln -s /usr/lib/ocaml/libcamlstr.a /usr/lib/ocaml/libstr.a
  fi

  # http://sourceforge.net/p/cil/bugs/106/ (don't build libcil.a, name it libcil.o) TODO: Patch instead of whole fixed copy of the makefile
  cp "$srcdir/cil-Makefile.in" "$srcdir/clpa/cil/Makefile.in"

  cd "$srcdir/clpa/"
  ./configure --prefix=/usr
  make
}

package() {
  unset MAKEFLAGS
  cd "$srcdir/clpa"

  # They don't have make install in this version
  #make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/bin"
  install -m 755 -t "$pkgdir/usr/bin" \
    "$srcdir/clpa/bin/cilcc" \
    "$srcdir/clpa/bin/cilly" \
    "$srcdir/clpa/bin/clpa" \
    "$srcdir/clpa/bin/clpa-extract" \
    "$srcdir/clpa/bin/clpa-intercept" \
    "$srcdir/clpa/bin/clpamake.pl" \
    "$srcdir/clpa/bin/clpa-worker" \
    "$srcdir/clpa/bin/cronus-server" \
    "$srcdir/clpa/bin/cronus-spawn-server" \
    "$srcdir/clpa/bin/cronus-spawn-worker" \
    "$srcdir/clpa/bin/cronus-worker" \
    "$srcdir/clpa/bin/dbfind" \
    "$srcdir/clpa/bin/dbfindc" \
    "$srcdir/clpa/bin/dbkeys" \
    "$srcdir/clpa/bin/extract.pl" \
    "$srcdir/clpa/bin/fork" \
    "$srcdir/clpa/bin/get_errorfile" \
    "$srcdir/clpa/bin/get_reports" \
    "$srcdir/clpa/bin/qclpa" \
    "$srcdir/clpa/bin/qclpa-biox" \
    "$srcdir/clpa/bin/random-sample.pl" \
    "$srcdir/clpa/bin/runregr" \
    "$srcdir/clpa/bin/setregr"
}
md5sums=('56e67190af5cd9d16bf12b8f28244d0d'
'dbd513e233a0da7d955102b4cae44b60')
