# Maintainer: David Spicer <azleifel at googlemail dot com>
# Contributor: Roberto Alsina <ralsina@netmanagers.com.ar>

pkgname=ttf-comfortaa
pkgver=2.004
pkgrel=1
pkgdesc="A simple, good looking, true type font."
arch=('any')
url="http://aajohan.deviantart.com/art/Comfortaa-font-105395949"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://fc02.deviantart.net/fs71/f/2013/128/5/3/comfortaa___font_by_aajohan-d1qr019.zip)
md5sums=('639bf60f1deebfb97135a37a52a1cf0d')

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"

    cd "${srcdir}/Comfortaa"
    install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm 644 "FONTLOG.txt" "${pkgdir}/usr/share/doc/$pkgname/FONTLOG.txt"
    install -Dm 644 "OFL.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
