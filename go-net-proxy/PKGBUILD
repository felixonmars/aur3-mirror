# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=go-net-proxy
pkgver=20121024
pkgrel=1
pkgdesc="Go support for a variety of proxy protocols"
arch=('i686' 'x86_64')
url="https://code.google.com/p/go/"
license=('BSD')
depends=('go')
options=('!strip' '!emptydirs')
_gourl=code.google.com/p/go.net/proxy

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
