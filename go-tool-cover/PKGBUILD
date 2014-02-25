# Maintainer: Willa Walthall <ghthor@gmail.com>
pkgname=go-tool-cover
pkgver=747.08c7
pkgrel=1
pkgdesc="The go cover tool used for sampling test coverage"
arch=('i686', 'x86_64')
url="http://code.google.com/p/go/source/browse?repo=tools&name=default#hg%2Fcmd%2Fcover"
license=('BSD')
groups=()
depends=('go')
makedepends=('go')
optdepends=()
provides=()
conflicts=('go-tools')
replaces=()
backup=()
options=()
install=
changelog=
source=('go.tools::hg+https://code.google.com/p/go.tools/')
noextract=()
md5sums=('SKIP')

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

    go build -o $srcdir/go/pkg/tool/$_platform/cover code.google.com/p/go.tools/cmd/cover
}

package() {
    install -Dm755 $srcdir/go/pkg/tool/$_platform/cover $pkgdir/usr/lib/go/pkg/tool/$_platform/cover

    msg2 "changelog(last 10)"
    (cd  $srcdir/go.tools ; \
        hg log -l 10 --template '{rev} {node|short} {date|shortdate} {desc|firstline}\n' ; \
        true )
}
