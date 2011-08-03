# Contributor: Thomas Gatzweiler <thomas.gatzweiler at gmail com>

pkgname=erlang-rfc4627-git
pkgver=20110803
pkgrel=1
pkgdesc="Erlang RFC4627 (JSON) codec and JSON-RPC server implementation."
arch=('i686' 'x86_64')
url="https://github.com/tonyg/erlang-rfc4627"
license=('unknown')
depends=('erlang' 'zip')
makedepends=('git')

_gitroot="https://github.com/tonyg/erlang-rfc4627.git"
_gitname="erlang-rfc4627"

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

  mkdir -p "$pkgdir"/usr/lib/erlang/lib/rfc4627
  cp -R dist/ebin "$pkgdir"/usr/lib/erlang/lib/rfc4627
  cp -R dist/src "$pkgdir"/usr/lib/erlang/lib/rfc4627
  cp -R dist/include "$pkgdir"/usr/lib/erlang/lib/rfc4627
  cp -R dist/doc "$pkgdir"/usr/lib/erlang/lib/rfc4627
  cp -R dist/test "$pkgdir"/usr/lib/erlang/lib/rfc4627
}
