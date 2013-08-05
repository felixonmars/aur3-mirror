# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=yturl
pkgver=1.15.4
pkgrel=1
pkgdesc="Print direct URLs to YouTube videos."
url=http://github.com/cdown/yturl
arch=( any )
license=( MIT )
depends=( python )
source=( "https://github.com/cdown/yturl/archive/v${pkgver}.zip" )
md5sums=('da623b7367f89f9abb2c555ebfdff996')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir"
}
