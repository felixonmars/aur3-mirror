 
# Maintainer: Jens Staal <staal1978@gmail.com>


pkgname=oh
# Shell formerly known as "gosh"
pkgver=20120526
pkgrel=1
pkgdesc="A Plan9 rc-inspired UNIX shell written in Go"
arch=('i686' 'x86_64')
url="https://github.com/michaelmacinnis/oh"
license=('MIT')
depends=('go-tecla' 'libtecla' 'go' 'ncurses')
options=('!strip' '!emptydirs')
install=install.oh
makedepends=('git')

_gourl=github.com/michaelmacinnis/oh

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
  mkdir -p "${pkgdir}/usr/bin"
  install -p -m755 ${srcdir}/bin/* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps ${srcdir}/{src,pkg} "$pkgdir/$GOPATH"

# getting rid of contaminating library files... A better way to do it?
# a disadvantage now is that the source distribution of the package gets lost.
  rm -rf $pkgdir/usr/lib
}
