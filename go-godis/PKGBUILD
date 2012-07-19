# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=go-godis
pkgver=20120719
pkgrel=1
pkgdesc="Redis client"
arch=('x86_64' 'i686')
url="https://github.com/simonz05/godis/"
license=('BSD')
makedepends=('go' 'go-check')
options=('!strip' '!emptydirs')
_gourl=github.com/simonz05/godis

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -d -v -x ${_gourl}/...
  mv src/github.com/simonz05/godis/example example
  GOPATH="$srcdir" go install ${_gourl}/...
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

  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  cp -r example "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
