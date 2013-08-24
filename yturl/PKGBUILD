# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yturl
pkgver=1.15.5
pkgrel=1
pkgdesc="Print direct URLs to YouTube videos."
url=http://github.com/cdown/yturl
arch=( any )
license=( MIT )
depends=( python )
source=( "https://github.com/cdown/yturl/archive/v${pkgver}.zip" )
md5sums=('6fe69f4ddf808b0dc7650f5eb5aacac3')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir"
}
