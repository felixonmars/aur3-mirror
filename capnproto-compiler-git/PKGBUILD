# Maintainer: zined <zined@adrianer.de>
pkgname=capnproto-compiler-git
pkgver=140.71afa60
pkgrel=2
pkgdesc="Cap'n Proto serialization/RPC system"
arch=('i686' 'x86_64')
url="http://kentonv.github.io/capnproto/"
license=('MIT')
makedepends=('git' 'cabal-install')

_gitroot=git://github.com/kentonv/capnproto.git
_gitname=capnproto

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/compiler"

  cabal install --prefix=$srcdir/$_gitname-build capnproto-compiler.cabal
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm0755 "$srcdir/$_gitname-build/bin/capnpc" "$pkgdir/usr/bin/capnpc"
}

# vim:set ts=2 sw=2 et:
