
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=go-tecla
#wrapper for libtecla in go.
pkgver=20120417
pkgrel=1
pkgdesc="A Go wrapper for libtecla, command-line editing library"
arch=('i686' 'x86_64')
url="https://github.com/michaelmacinnis/tecla"
license=('MIT')
depends=('libtecla' 'go')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl=github.com/michaelmacinnis/tecla

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
