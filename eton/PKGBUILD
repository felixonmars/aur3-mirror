# Maintainer: Logan Buchy <logan.buchy@gmail.com>

pkgname=eton
pkgver=git
pkgrel=1
pkgdesc="A note-taking cli tool"
arch=("any")
url="https://github.com/siadat/eton"
license=("unknown")
makedepends=('go')
options=('!strip' '!emptydirs')
source=('git://github.com/siadat/eton.git')
md5sums=("SKIP")
provies=("eton")
conflicts=("eton")
_gourl='github.com/siadat/eton'

build() {
  GOPATH="$srcdir" go get -u ${_gourl}/...
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH"
}	
