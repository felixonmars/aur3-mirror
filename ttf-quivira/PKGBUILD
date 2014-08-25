pkgname=ttf-quivira
pkgver=4.1
pkgrel=1
pkgdesc="A Unicode-based OpenType font with a large character repertoire."
arch=('any')
url="http://www.quivira-font.com"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.quivira-font.com/files/Quivira.otf'
        'LICENSE')
sha256sums=('03c2f593b224efffceac6f7f3090cdc935f0817399fcc607e4c7cc1b097b3b5a'
            '42cb297aa2f57d4b5db7ce6fd0f38326dfea5f5a4f187d1a001caadb2cadab90')
install=$pkgname.install

package() {
 install -Dm644 Quivira.otf "${pkgdir}/usr/share/fonts/TTF/Quivira.otf"
 install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
