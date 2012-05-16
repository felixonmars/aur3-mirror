pkgname=go-web
pkgver=1
pkgrel=3
pkgdesc='Minimalistic web server ("web.go")'
arch=('x86_64' 'i686')
url='http://github.com/hoisie/web'
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
_gourl=github.com/hoisie/web

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  GOPATH="$srcdir" go test -v -x ${_gourl}
}

package() {
  source /etc/profile.d/go.sh
  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps ${srcdir}/{src,pkg} "$pkgdir/$GOPATH"
}

# vim:set ts=2 sw=2 et:
