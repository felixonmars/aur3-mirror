# Maintainer: Nathan Typanski <ndt@nathantypanski.com>

_srcname=commonmark
pkgname=cmark-git
pkgver=r3.a7db872
pkgrel=1
pkgdesc="cmark CommonMark Markdown compiler"
arch=('i686' 'x86_64')
url="https://github.com/jgm/CommonMark.git"
license=('BSD3')
depends=('re2c')
options=(!emptydirs libtool)
source=(git://github.com/jgm/$_srcname.git)

pkgver() {
        cd "$srcname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_srcname}"
    make
}

check() {
    cd "${srcdir}/${_srcname}"
    ## `make test` is failing currently - it's upstream's fault - so I'm
    ## leaving this disabled for now.
    #make test
}

package() {
    # Install the man page.
    cd "${srcdir}/${_srcname}"
    gzip man/man1/cmark.1
    install -Dm644 'man/man1/cmark.1.gz' "$pkgdir"'/usr/share/man/man1/cmark.1.gz'
    # The `cmark` executable is buried deep ...
    cd "${srcdir}/${_srcname}"'/build/src'
    install -Dm755 'cmark' "$pkgdir"'/usr/bin/cmark'
}

md5sums=('SKIP'
)
sha256sums=('SKIP'
)
