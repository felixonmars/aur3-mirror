pkgname=go-tool-present
pkgver=1011.83e8
pkgrel=1
pkgdesc="The go tool present uses for making presentations"
arch=('i686', 'x86_64')
url="http://code.google.com/p/go/source/browse?repo=tools&name=default#hg%2Fpresent"
license=('BSD')
makedepends=('go')
conflicts=('go-tools')
source=(
    'go.tools::hg+https://code.google.com/p/go.tools/'
    'go.net::hg+https://code.google.com/p/go.net/')
md5sums=('SKIP' 'SKIP')

_platform=""
if [ "$CARCH" == 'x86_64' ]; then
    _platform="linux_amd64"
    export GOARCH=amd64
elif [ "$CARCH" == 'i686' ]; then
    _platform="linux_386"
fi

pkgver() {
  cd "$srcdir/go.tools"
  local _id=$(hg identify -i)
  echo $(hg identify -n).${_id:0:4}
}

build() {
    export GOPATH="$srcdir/"

    # Make a copy of the go.tools repository in the GOPATH
    mkdir -p "$srcdir/src/code.google.com/p"
    cp -r "$srcdir/go.tools" "$srcdir/src/code.google.com/p/go.tools"
    cp -r "$srcdir/go.net" "$srcdir/src/code.google.com/p/go.net"

    go build -o $srcdir/go/pkg/tool/$_platform/present code.google.com/p/go.tools/cmd/present
}

package() {
    install -Dm755 $srcdir/go/pkg/tool/$_platform/present $pkgdir/usr/lib/go/pkg/tool/$_platform/present
    install -dm755 $srcdir/go.tools/cmd/present/static $pkgdir/usr/lib/go/src/pkg/code.google.com/p/go.tools/cmd/present
    install -dm755 $srcdir/go.tools/cmd/present/templates $pkgdir/usr/lib/go/src/pkg/code.google.com/p/go.tools/cmd/present/templates

    cp -r $srcdir/go.tools/cmd/present/static $pkgdir/usr/lib/go/src/pkg/code.google.com/p/go.tools/cmd/present
    cp -r $srcdir/go.tools/cmd/present/templates $pkgdir/usr/lib/go/src/pkg/code.google.com/p/go.tools/cmd/present
}
