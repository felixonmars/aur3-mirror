# Maintainer: Christopher Down <iofc.org@christopher.down>

pkgname=cellout-git
pkgver=20120524
pkgrel=2
pkgdesc="A simple battery status printer."
arch=(any)
url="http://github.com/cdown/cellout"
license=(BSD)
depends=()
makedepends=(git)

_gitroot="git://github.com/cdown/cellout.git"
_gitname="cellout"

build() {
    cd "$srcdir"
    msg "Connecting to Git server..."

    if [ -d "$_gitname" ] ; then
        cd "$_gitname" && git pull origin
    else
        git clone "$_gitroot" "$_gitname"
    fi
    msg "Git update done."

    msg "Compressing manual page..."
    gzip -9 "$srcdir/$_gitname/$_gitname.1"
}

package() {
    install -d "$pkgdir/usr/"{bin/,share/man/man1/}
    install -m755 \
        "$srcdir/$_gitname/$_gitname" \
        "$pkgdir/usr/bin/$_gitname"
    install -m755 \
        "$srcdir/$_gitname/$_gitname.1.gz" \
        "$pkgdir/usr/share/man/man1/$_gitname.1.gz"
}
