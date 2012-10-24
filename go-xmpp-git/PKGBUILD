# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=go-xmpp-git
pkgver=20121024
pkgrel=1
pkgdesc="Go XMPP client library"
arch=('i686' 'x86_64')
url="https://github.com/agl/xmpp"
license=('BSD')
depends=('go')
provides=('go-xmpp')
conflicts=('go-xmpp')
options=('!strip' '!emptydirs')
_gourl=github.com/agl/xmpp

_gitroot=https://github.com/agl/xmpp.git
_gitname=go-xmpp

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
