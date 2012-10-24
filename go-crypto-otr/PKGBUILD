# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=go-crypto-otr
pkgver=20121024
pkgrel=2
pkgdesc="Go OTR library"
arch=('i686' 'x86_64')
url="https://code.google.com/p/go/"
license=('BSD')
depends=('go')
options=('!strip' '!emptydirs')
_gourl=code.google.com/p/go.crypto/otr

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -v -x ${_gourl}/...
}

check() {
  source /etc/profile.d/go.sh
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}/...
}

package() {
  source /etc/profile.d/go.sh
  mkdir -p "${pkgdir}/$GOPATH"
  cp -Rv --preserve=timestamps "${srcdir}"/{src,pkg} "${pkgdir}/$GOPATH"
}

# vim:set ts=2 sw=2 et:
