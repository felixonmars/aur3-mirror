# Contributor: Thomas Gatzweiler <thomas.gatzweiler at gmail com>

pkgname=erlang-misultin-git
pkgver=20110805
pkgrel=2
pkgdesc="Misultin is an Erlang library for building fast lightweight HTTP(S) servers, which also supports websockets."
arch=('i686' 'x86_64')
url="https://github.com/ostinelli/misultin"
license=('BSD')
depends=('erlang')
makedepends=('git')

_gitroot="https://github.com/ostinelli/misultin.git"
_gitname="misultin"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd "$srcdir"/$_gitname

  make || return 1

  mkdir -p "$pkgdir"/usr/lib/erlang/lib/misultin
  cp -R ebin "$pkgdir"/usr/lib/erlang/lib/misultin
  cp -R src "$pkgdir"/usr/lib/erlang/lib/misultin
  cp -R include "$pkgdir"/usr/lib/erlang/lib/misultin
  cp -R examples "$pkgdir"/usr/lib/erlang/lib/misultin
  cp -R test "$pkgdir"/usr/lib/erlang/lib/misultin

  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}