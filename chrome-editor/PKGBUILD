pkgname=chrome-editor
pkgver=1.0
pkgrel=1
pkgdesc="Backend for editing textareas directily in editor of your choice"
url="https://github.com/seletskiy/chrome-editor"
arch=('i686', 'x86_64')
license=('GPL')
makedepends=('go')

source=("git://github.com/seletskiy/chrome-editor.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"

    export GOPATH=$(pwd)
    go build
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin"
}
