# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=delve
pkgver=0.3.0.beta
pkgrel=1
pkgdesc='Go debugger'
arch=('x86_64' 'i686')
url='https://github.com/derekparker/delve'
license=('MIT')
makedepends=('go' 'git')
conflicts=('dlv')
source=("git://github.com/derekparker/delve#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  export GOPATH="$srcdir"
  go get github.com/derekparker/delve/cmd/dlv
  rm -rf "$srcdir/src/github.com/derekparker/delve"
  mv delve "$srcdir/src/github.com/derekparker/"
}

build() {
  export GOPATH="$srcdir"
  go get github.com/derekparker/delve/cmd/dlv
}

package() {
  install -Dm755 "bin/dlv" "$pkgdir/usr/bin/dlv"
  install -Dm644 "src/github.com/derekparker/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
