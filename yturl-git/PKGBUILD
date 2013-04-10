# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yturl-git
_gitname=yturl
pkgver=20130410084623.8b993e4
pkgrel=1
pkgdesc="Get direct media URLs to YouTube videos"
license=( "MIT" )
url="https://github.com/cdown/yturl"

arch=( "any" )
depends=( "python2" )
makedepends=( "git" )
conflicts=( "yturl" )
provides=( "yturl" )
source=(
    "git://github.com/cdown/yturl.git"
)
md5sums=(
    "SKIP"
)

pkgver() {
    cd "$_gitname"
    printf '%d.%s\n' "$(date -u -d "@$(git log -1 --format="%ct")" +%Y%m%d%H%M%S)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "$_gitname/yturl" "$pkgdir/usr/bin/yturl"
}
