# Maintainer: Aditya Mukerjee <dev@chimeracoder.net>
# PKGBUILD Version history: https://github.com/ChimeraCoder/PKGBUILDS

pkgname=gojson-git
pkgver=0.2
pkgrel=1
pkgdesc="A simple command-line tool for manipulating JSON for use in developing Go code"
arch=('x86_64' 'i686')
url="https://github.com/ChimeraCoder/gojson"
license=('GPL')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("git+git://github.com/ChimeraCoder/gojson.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/gojson"

    go build
}

package() {
    cd "$srcdir/gojson"

    install -Dm755 "gojson" "$pkgdir/usr/bin/gojson"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/gojson/LICENSE"
}

# vim:set ts=2 sw=2 et:
