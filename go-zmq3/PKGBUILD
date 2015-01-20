# Maintainer: Thomas Laroche <tho.laroche@gmail.com>
pkgname=go-zmq3
pkgver=164.8521256
pkgrel=1
pkgdesc="A Go interface to ZeroMQ version 3"
arch=('i686' 'x86_64')
url="https://github.com/pebbe/zmq3"
license=('custom:BSD2')
depends=('zeromq3' 'go')
makedepends=('git')
options=('!strip' '!emptydirs' 'staticlibs')
_gourl=github.com/pebbe/zmq3
source=("$pkgname::git+https://${_gourl}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir"
  mkdir -p src/$(dirname ${_gourl})
  ln -fs "$srcdir/$pkgname" src/${_gourl}
  GOPATH="$srcdir" go get -d -v -x ${_gourl}
  rm -f "$srcdir/$pkgname/$pkgname" #Fix for symlink created by go fix
}

build() {
  cd "$srcdir"
  GOPATH="$(pwd)" go install -v -x ${_gourl}
}

package() {
  cd "$srcdir"
  export GOPATH="/usr/lib/go"
  mkdir -p $pkgdir$GOPATH/{src,pkg}

  cp -rvL --preserve=timestamps "$srcdir"/{src,pkg} "$pkgdir/$GOPATH"
  rm -rf "$pkgdir/$GOPATH/src/$_gourl/.git"
  install -Dm644 "$srcdir/src/$_gourl/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LiCENSE"
}

# vim:set ts=2 sw=2 et:
