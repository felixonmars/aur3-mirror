# Maintainer: Gilbert Kennen <gilbert firewatcher org>
pkgname=elixir-git
pkgver=20141129
pkgrel=1
pkgdesc="a functional meta-programming aware language built on top of the Erlang VM - current git master"
url="http://elixir-lang.org"
arch=('any')
license=('Apache' 'custom:EPL')
depends=('erlang-nox')
makedepends=('git')
provides=('elixir')
conflicts=('elixir')
replaces=()
backup=()
source=("git://github.com/elixir-lang/elixir.git")
sha512sums=('SKIP')

build() {
  cd ${srcdir}/elixir
  make
}

check() {
  cd ${srcdir}/elixir
  make test_erlang
} 

package() {
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  cd ${srcdir}/elixir

  install -Dm644 {LEGAL,LICENSE} "${pkgdir}/usr/share/licenses/${pkgname}"

  make DESTDIR=$pkgdir PREFIX=/usr install
}
