# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=mpdmenu
pkgver=1.0.3
pkgrel=1
pkgdesc="Simple dmenu frontend for MPD"
url="http://github.com/cdown/mpdmenu"
arch=( "any" )
license=( "MIT" )
depends=( dmenu )

source=(
    "https://github.com/cdown/mpdmenu/archive/v${pkgver}.zip"
)
md5sums=('8e2d74920faa972f2559a96073790d09')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/mpdmenu" \
        "$pkgdir/usr/bin/mpdmenu"
}
