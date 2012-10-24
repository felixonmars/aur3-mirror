# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=go-xmpp-client-git
pkgver=20121024
pkgrel=4
pkgdesc="A simple XMPP client written in pure Go"
arch=('i686' 'x86_64')
url="https://github.com/agl/xmpp-client"
license=('unkown')
depends=('go' 'go-crypto-otr'  'go-net-proxy' 'go-xmpp-git')
makedepends=('git')
provides=('go-xmpp-client')
options=('!strip' '!emptydirs')
_gourl=github.com/agl/xmpp-client

_gitroot=https://github.com/agl/xmpp-client.git
_gitname=xmpp-client

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

  #if [ "$CARCH" = "x86_64" ]; then
  #  platform=linux_amd64
  #else
  #  platform=linux_386
  #fi

  #mkdir -p "${pkgdir}/$GOPATH/pkg/$platform/${_gourl}"
  #cp -Rv --preserve=timestamps "${srcdir}/pkg/$platform/${_gourl}" \
  #  "${pkgdir}/$GOPATH/pkg/$platform/${_gourl}"

  mkdir -p "${pkgdir}/$GOPATH/src/${_gourl}"
  cp -Rv --preserve=timestamps "${srcdir}/src/${_gourl}" \
    "${pkgdir}/$GOPATH/src/${_gourl}"

  install -Dm755 "${srcdir}/bin/xmpp-client" "${pkgdir}/usr/bin/xmpp-client"
}

# vim:set ts=2 sw=2 et:
