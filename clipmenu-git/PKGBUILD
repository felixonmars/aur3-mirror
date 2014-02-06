# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=clipmenu-git
_gitname=clipmenu
pkgver=11.c40456c
pkgrel=1
pkgdesc="A simple clipboard manager using dmenu."
license=( MIT )
url=https://github.com/cdown/mpdmenu
depends=( dmenu xsel )

arch=( any )
makedepends=( git )
conflicts=( clipmenu )
provides=( clipmenu  )
source=( git://github.com/cdown/clipmenu.git )
md5sums=( SKIP )

pkgver() {
    cd "$_gitname"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    install -D -m755 \
        "$_gitname/clipmenu" \
        "$pkgdir/usr/bin/clipmenu"
    install -D -m755 \
        "$_gitname/clipmenud" \
        "$pkgdir/usr/bin/clipmenud"
}
