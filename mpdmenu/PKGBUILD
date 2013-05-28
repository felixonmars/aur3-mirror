# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=mpdmenu
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple dmenu frontend for MPD"
url="http://github.com/cdown/mpdmenu"
arch=( "any" )
license=( "MIT" )
depends=( dmenu )

source=(
    "https://github.com/cdown/mpdmenu/archive/v${pkgver}.zip"
)
md5sums=('d7c785de08255b8198c701e5f6112133')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/mpdmenu" \
        "$pkgdir/usr/bin/mpdmenu"
}
