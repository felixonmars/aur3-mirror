# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yturl-git
_gitname=yturl
pkgver=20130905223925.685382e
pkgrel=1
pkgdesc="Print direct URLs to YouTube videos."
url=http://github.com/cdown/yturl
license=( MIT )
depends=( python python-docopt )

arch=( any )
makedepends=( git )
conflicts=( yturl )
provides=( yturl )
source=( git://github.com/cdown/yturl.git )
md5sums=( SKIP )

pkgver() {
    cd "$_gitname"
    printf '%d.%s\n' "$(date -u -d "@$(git log -1 --format="%ct")" +%Y%m%d%H%M%S)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_gitname"
    python setup.py install --root="$pkgdir"
}
