# Maintainer: Bastien Dejean <baskerville at lavabit.com>

pkgname=xcb-man-pages-git
pkgver=20120819
pkgrel=1
pkgdesc="XCB manpages generated from xproto.xml"
arch=('any')
url="https://github.com/mstap/xcb-man-pregenerated"
license=('MIT')
makedepends=('git')
provides=('xcb-man-pages')
conflicts=('xcb-man-pages')
_gitroot='git://github.com/mstap/xcb-man-pregenerated.git'
_gitname='xcb-man-pages'

build() {
    cd "$srcdir"
    if [ -d "$_gitname" ] ; then
        cd "$_gitname" && git pull origin
    else
        git clone "$_gitroot" "$_gitname"
    fi

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

    cd "$srcdir/${_gitname}-build"
    gzip *
}

package() {
    cd "$srcdir/$_gitname-build"
    mkdir -p "$pkgdir/usr/share/man/man3"
    install -m644 -t "$pkgdir/usr/share/man/man3" *
}
