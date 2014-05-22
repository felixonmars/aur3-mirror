# Maintainer: NAME <EMAIL>

pkgname=tsuru
pkgver=0.9.0
pkgrel=1
pkgdesc="Tsuru is an extensible and open source Platform as a Service software."
arch=('x86_64' 'i686')
url="http://www.tsuru.io/"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
_gourl=github.com/tsuru/tsuru/cmd/tsuru

build() {
  GOPATH="$srcdir" go get -fix -v ${_gourl}
}


package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et: