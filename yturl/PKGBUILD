# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yturl
pkgver=1.16
pkgrel=1
pkgdesc="Print direct URLs to YouTube videos."
url=http://github.com/cdown/yturl
arch=( any )
license=( MIT )
depends=( python )
source=( "https://github.com/cdown/yturl/archive/v${pkgver}.zip" )
md5sums=('408e369c1d79dbf7346a50e4e7b32ca7')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir"
}
