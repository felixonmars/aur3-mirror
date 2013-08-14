# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=mpdmenu-git
_gitname=mpdmenu
pkgver=20130619045905.1319722
pkgrel=1
pkgdesc="Simple dmenu frontend for MPD"
license=( MIT )
url=https://github.com/cdown/mpdmenu
depends=( dmenu )

arch=( any )
makedepends=( git )
conflicts=( mpdmenu )
provides=( mpdmenu  )
source=( git://github.com/cdown/mpdmenu.git )
md5sums=( SKIP )

pkgver() {
    cd "$_gitname"
    printf '%d.%s\n' "$(date -u -d "@$(git log -1 --format="%ct")" +%Y%m%d%H%M%S)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m755 \
        "$_gitname/mpdmenu" \
        "$pkgdir/usr/bin/mpdmenu"
}
