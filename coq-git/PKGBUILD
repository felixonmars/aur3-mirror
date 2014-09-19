# Maitainer: Reventlov <contact+aur at volcanis dot me>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: acieroid
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: George Giorgidze <giorgidze@gmail.com>
pkgname=coq-git
pkgver=
pkgrel=2
pkgdesc='Formal proof management system. Full version that includes CoqIDE. Git version.'
arch=('i686' 'x86_64')
url='http://coq.inria.fr/'
license=('GPL')
options=('!emptydirs')
depends=('gtk2' 'ocaml' 'camlp4' 'gtksourceview2')
makedepends=('ocaml-findlib' 'lablgtk2' 'git')
optdepends=('coq-doc')
source=("$pkgname"::'git+https://github.com/coq/coq.git')
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
  cd "$srcdir/coq-git"

  ./configure \
    -prefix '/usr' \
    -mandir '/usr/share/man' \
    -configdir '/etc/xdg/coq/' \
    -opt \
    -coqide opt \
    -usecamlp4 \
    -with-doc no

  make world
}

package() {
  cd "$srcdir/coq-git"

  make COQINSTALLPREFIX="$pkgdir" install
}
