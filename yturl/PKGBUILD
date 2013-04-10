# Maintainer: Chris Down <chris@chrisdown.name>

pkgname="yturl"
pkgver=1.13.1
pkgrel=1
pkgdesc="Get direct media URLs to YouTube videos"
url="http://github.com/cdown/yturl"
arch=( "any" )
license=( "MIT" )
depends=( "python2" )
source=(
    "https://github.com/cdown/yturl/archive/v${pkgver}.zip"
)
md5sums=('a8159ed73ef0640b0b408fc9d0617f78')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/yturl" \
        "$pkgdir/usr/bin/yturl"
}
