# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=tzupdate-git
_gitname=tzupdate
pkgver=20130823150922.47977f2
pkgrel=1
pkgdesc="Set the local timezone based on IP geolocation."
license=( MIT )
url=https://github.com/cdown/tzupdate
depends=( python )

arch=( any )
makedepends=( git )
conflicts=( tzupdate )
provides=( tzupdate )
source=( git://github.com/cdown/tzupdate.git )
md5sums=( SKIP )

pkgver() {
    cd "$_gitname"
    printf '%d.%s\n' "$(date -u -d "@$(git log -1 --format="%ct")" +%Y%m%d%H%M%S)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_gitname"
    python setup.py install --root="$pkgdir"
}
