# Maintainer: Peter Cai <xqsx43cxy@gmail.com>

pkgname=shadowsocks-go-git
pkgver=20141108
pkgrel=1
pkgdesc="A port of Shadowsocks, a simple and lightweight network proxy tool."
arch=('x86_64' 'i686')
url="https://github.com/shadowsocks/shadowsocks-go"
license=('MIT')
depends=('go')
makedepends=('git' 'mercurial')
options=('!strip' '!emptydirs')
_url_local=github.com/shadowsocks/shadowsocks-go/cmd/shadowsocks-local
_url_server=github.com/shadowsocks/shadowsocks-go/cmd/shadowsocks-server

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_url_local}
  GOPATH="$srcdir" go get -fix -v -x ${_url_server}
}

check() {
  GOPATH="$srcdir" go test -v -x ${_url_local}
  GOPATH="$srcdir" go test -v -x ${_url_server}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH" 
}
