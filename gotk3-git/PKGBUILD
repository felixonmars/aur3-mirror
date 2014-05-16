# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gotk3-git
pkgver=0.2.0
pkgrel=1
pkgdesc="Go bindings for GTK3"
arch=('x86_64' 'i686')
url="https://github.com/conformal/gotk3"
license=('ISC')
depends=('go' 'gtk3')
makedepends=('git')
conflicts=('gotk3')
provides=('gotk3')
options=('!strip' 'staticlibs')
_gourl=github.com/conformal/gotk3

build() {
  GOPATH="$srcdir" go get -fix -v -x $_gourl/gtk
}

package() {
  GOPATH="$pkgdir/usr/lib/go" 
  mkdir -p "$GOPATH/src/pkg"
  cp -Rv --preserve=timestamps "$srcdir/pkg" "$GOPATH"
  cp -Rv --preserve=timestamps "$srcdir/src/"* "$GOPATH/src/pkg"
  rm -r "$GOPATH/src/pkg/$_gourl/.git"
  install -Dm644 "$srcdir/src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
