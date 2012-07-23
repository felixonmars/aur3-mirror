# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=go-pystring
pkgver=20120723
pkgrel=1
pkgdesc="Python-like string objects for Go"
arch=('x86_64' 'i686')
url="https://github.com/xyproto/pystring"
license=('BSD')
makedepends=('go' 'go-check')
options=('!strip' '!emptydirs')
_gourl=github.com/xyproto/pystring

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
  cp -Rv --preserve=timestamps ${srcdir}/{src,pkg} "${pkgdir}/$GOPATH"

  # Package license (if available)
  for f in LICENSE COPYING; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
