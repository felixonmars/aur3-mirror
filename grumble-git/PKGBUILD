# Maintainer: Tim Cooper <tim.cooper@layeh.com>

pkgname=grumble-git
_gitname=grumble
pkgver=244.ef533d8
pkgrel=1
pkgdesc="an implementation of a server for the Mumble voice chat system"
arch=('x86_64' 'i686')
url="https://github.com/mumble-voip/grumble"
license=('BSD')
depends=()
makedepends=('go')
source=('git+https://github.com/mumble-voip/grumble')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  export GOPATH="$(pwd)/go"
  rm -Rf go/src/mumble.info/grumble
  mkdir -p go/src/mumble.info
  mv -f "$_gitname" go/src/mumble.info

  go get mumble.info/grumble/cmd/grumble
}

package() {
  install -D go/bin/grumble "$pkgdir/usr/bin/grumble"
  install -Dm0644 go/src/mumble.info/grumble/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
