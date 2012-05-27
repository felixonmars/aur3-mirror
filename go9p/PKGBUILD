
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=go9p
pkgver=20120527
pkgrel=1
pkgdesc="9P2000 file system/protocol bindings for go"
arch=('i686' 'x86_64')
url="http://code.google.com/p/go9p/"
license=('MIT')
depends=('go')
makedepends=('mercurial')
options=('!strip' '!emptydirs')
_gourl=code.google.com/p/go9p

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}/...
}

check() {
  source /etc/profile.d/go.sh
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}/...
}

package() {
  source /etc/profile.d/go.sh
# file name conflicts with existing core packages so binaries installed in a new sub directory
  mkdir -p "${pkgdir}/usr/bin/go"
  install -p -m755 ${srcdir}/bin/* "$pkgdir/usr/bin/go"

  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps ${srcdir}/{src,pkg} "$pkgdir/$GOPATH"
}

