pkgname=grenchman
pkgver=0.2.0
pkgrel=1
pkgdesc='Fast invocation of Clojure code over nREPL.'
arch=('any')
url='http://leiningen.org/grench.html'
license=('GNU General Public License')
depends=('opam' 'libffi' 'readline')
source=('git+https://github.com/technomancy/grenchman')
md5sums=('SKIP')

build() {
  opam init --yes || true
  . ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
  opam install ocamlfind core async ctypes --yes
  cd $pkgname
  ocamlbuild -use-ocamlfind -lflags -cclib,-lreadline grench.native
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm755 $srcdir/grenchman/grench.native $pkgdir/usr/bin/grench
}
