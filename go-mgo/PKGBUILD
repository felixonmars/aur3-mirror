# Maintainer: Thomas Laroche <tho.laroche@gmail.com>
pkgname=go-mgo
_version=2
pkgver=2.445c05a
pkgrel=1
pkgdesc="MongoDB driver for Go"
arch=('i686' 'x86_64')
url="http://labix.org/mgo"
license=('custom:Simplified BSD License')
depends=('go')
makedepends=('git')
options=('!strip' '!emptydirs' 'staticlibs')
_gourl=gopkg.in/mgo.v2
source=("$pkgname::git+http://${_gourl}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $_version.$(git rev-parse --short HEAD)
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
  install -Dm644 "$srcdir/src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LiCENSE"
}

# vim:set ts=2 sw=2 et:
