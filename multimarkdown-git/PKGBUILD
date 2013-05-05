# Contributor: Felix Hanley <felix@seconddrawer.com.au>

pkgname=multimarkdown-git
_pkgname=multimarkdown
pkgver=3.7.1.2.g0d9c20e
pkgrel=1
pkgdesc="Expanded version of John Gruber's original Markdown"
makedepends=('git' 'glib2')
optdepends=('texlive-most: latex and PDF output support')
url="https://github.com/fletcher/peg-multimarkdown"
license=('GPL2')
arch=('x86_64')
provides=('multimarkdown')
conflicts=('multimarkdown')
source=("$_pkgname::git://github.com/fletcher/peg-multimarkdown.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "$srcdir/$_pkgname"
    export C_INCLUDE_PATH=:/usr/include/glib-2.0:/usr/lib/glib-2.0/include:/usr/lib/x86_64-linux-gnu/glib-2.0/include/
    make
    make docs
}

package() {
    cd "$srcdir/$_pkgname"

    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 multimarkdown \
        scripts/mmd2tex \
        scripts/mmd2pdf \
        scripts/mmd2opml \
        scripts/mmd2odf \
        scripts/mmd2all \
        "$pkgdir/usr/bin/"
}
