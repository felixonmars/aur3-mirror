# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=ttf-st-andrew
pkgver=0
pkgrel=2
pkgdesc="Spray paint style font"
arch=('any')
url="http://dirt2.com/fonts/st-andrew"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=('http://dirt2.com/downloads/fonts/StAndrew.zip'
        'LICENSE')
md5sums=('610ffd9467df119ee3fb41ed0c3e4f95'
         'eee7fbdeda65c8beedb5368311c9b6a5')

package() {
 install -Dm 644 "$srcdir/StAndrew.ttf" "$pkgdir/usr/share/fonts/TTF/StAndrew.ttf"
 install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
