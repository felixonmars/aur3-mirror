# Maintainer: Sietse van der Molen <sietse at vdmolen.eu>
pkgname=comcast
pkgver=1
pkgrel=1
pkgdesc="Simulating shitty network connections so you can build better systems. "
arch=('any')
url="https://github.com/tylertreat/Comcast"
license=('Apache')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
_gourl=github.com/tylertreat/comcast

build() {
  GOPATH="$srcdir" go get -fix -v ${_gourl}
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/src/$_gourl/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
