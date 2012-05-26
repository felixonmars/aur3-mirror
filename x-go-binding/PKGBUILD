
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=x-go-binding
#wrapper for libtecla in go.
pkgver=20120417
pkgrel=1
pkgdesc="X11 protocol bindings for go"
arch=('i686' 'x86_64')
url="http://code.google.com/p/x-go-binding/"
license=('BSD')
depends=('go')
makedepends=('mercurial')
options=('!strip' '!emptydirs')
_gourl=code.google.com/p/x-go-binding/xgb

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  source /etc/profile.d/go.sh
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}/...
}

package() {
  source /etc/profile.d/go.sh
  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps ${srcdir}/{src,pkg} "$pkgdir/$GOPATH"
} 
