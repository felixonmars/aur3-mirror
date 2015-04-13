pkgname=emily
pkgver=0.2
pkgrel=1
pkgdesc='A programming language where everything is a function'
arch=('i686' 'x86_64')
url='http://emilylang.org/'
license=('MIT')
#depends=('ocaml')
makedepends=('ocaml' 'opam')
#checkdepends=('curl')
options=('!emptydirs')
source=(https://github.com/mcclure/emily/archive/emily-$pkgver.tar.gz)
md5sums=('42ed34c34f64ad01cba2794c064a57c7')

prepare() {
  cd emily-emily-$pkgver
  
  msg 'install ocaml package. opam init might be required first'
  opam init --yes
  eval `opam config env`
  opam install --yes ocamlfind sedlex containers fileutils
}

build() {
  cd emily-emily-$pkgver
  eval `opam --root=../opam config env`

  make
}

#check() {
#  cd emily-emily-$pkgver
#  make test || true
#}

package() {
  cd emily-emily-$pkgver

  make PREFIX="$pkgdir/usr" install

  # install docs as per user request
  install -D -m644 LICENSE.md \
    "$pkgdir"/usr/share/licenses/emily/LICENSE
}

# vim:set ts=2 sw=2 et:
