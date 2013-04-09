pkgname="yturl"
pkgver=1.13.0
pkgrel=1
pkgdesc="Get direct media URLs to YouTube videos"
url="http://github.com/cdown/yturl"
arch=( "any" )
license=( "MIT" )
depends=( "python2" )
source=(
    "https://github.com/cdown/yturl/archive/v${pkgver}.zip"
)
md5sums=(
    "efe6ea4f2ac24bf2d0db5bd1bfe274e8"
)

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/yturl" \
        "$pkgdir/usr/bin/yturl"
}
