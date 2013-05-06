# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=dwm-cdown-git
_gitname=dwm
pkgver=20130505124908.be5f3a6
pkgrel=1
pkgdesc="A dynamic window manager for X - cdown personalisations"
license=( "MIT" )
url="https://github.com/cdown/dwm"
depends=('libx11' 'libxinerama')

arch=( "any" )
makedepends=( "git" )
conflicts=( "dwm" )
provides=( "dwm" )
source=(
    "git://github.com/cdown/dwm.git"
)
md5sums=(
    "SKIP"
)

pkgver() {
    cd "$_gitname"
    printf '%d.%s\n' "$(date -u -d "@$(git log -1 --format="%ct")" +%Y%m%d%H%M%S)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    make
}

package() {
    cd "$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
