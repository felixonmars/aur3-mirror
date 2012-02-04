# Maintainer: Taylor Venable <taylor@metasyntax.net>

pkgname=piqi-git
pkgver=20110918
pkgrel=1
pkgdesc='A set of languages and open-source tools for working with structured data.'
arch=('i686' 'x86_64')
url='http://piqi.org/'
license=('Apache')
depends=('ocaml' 'ocaml-findlib')
makedepends=('git')
provides=('piqi')
conflicts=('piqi')
options=('!strip' '!makeflags')

_gitroot='git://github.com/alavrik/piqi.git'
_gitname='piqi'

build() {
  cd $startdir/src

  if [[ -d $startdir/src/$_gitname ]]; then
    cd $_gitname && git pull origin
  else
    git clone --depth=1 $_gitroot
    cd $_gitname
  fi

  source setenv.sh
  export PIQI_PREFIX="$pkgdir/usr"

  make deps  || return 1
  make       || return 1
  make ocaml || return 1
}

package() {
  cd $_gitname
  mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"

  source setenv.sh
  export PIQI_PREFIX="$pkgdir/usr"

  env DESTDIR="$pkgdir/usr" make install
  env DESTDIR="$pkgdir/usr" \
      OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
      make ocaml-install
}
