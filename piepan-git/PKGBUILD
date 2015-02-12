# Maintainer: Tim Cooper <tim.cooper@layeh.com>

pkgname=piepan-git
pkgver=v0.5.0.r4.g636bf05
pkgrel=1
pkgdesc="an easy to use framework for writing scriptable Mumble bots"
arch=('x86_64' 'i686')
url="https://github.com/layeh/piepan"
license=('MIT')
depends=('ffmpeg' 'opus' 'lua51')
makedepends=('git' 'go')
source=()
md5sums=()

pkgver() {
  cd "$srcdir/src/github.com/layeh/piepan"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir"
  export GOPATH=`pwd`
  go get -u github.com/layeh/piepan/cmd/piepan
}

package() {
  cd "$srcdir"
  install -Dm755 bin/piepan "$pkgdir/usr/bin/piepan"
  install -Dm644 src/github.com/layeh/piepan/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 src/github.com/layeh/piepan/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 src/github.com/layeh/piepan/plugins/javascript/README.md "$pkgdir/usr/share/doc/$pkgname/javascript.md"
  install -Dm644 src/github.com/layeh/piepan/plugins/lua/README.md "$pkgdir/usr/share/doc/$pkgname/lua.md"
  mkdir -p "$pkgdir/usr/share/piepan"
  cp -r src/github.com/layeh/piepan/_examples "$pkgdir/usr/share/piepan/examples"
}
