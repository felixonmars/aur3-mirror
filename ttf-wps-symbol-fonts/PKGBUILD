# Contributor: Figue <ffigue at gmail dot com>

pkgname=ttf-wps-symbol-fonts
pkgver=20130706
pkgrel=1
pkgdesc="Symbol fonts needed by Kingsoft Office. Most of them have copyright issue, so Kingsoft Office do not carry them directly."
arch=('any')
url="http://wps-community.org/download/fonts/"
license=('copyright')
depends=('fontconfig' 'xorg-font-utils' 'kingsoft-office')
install=ttf.install
source=(http://wps-community.org/download/fonts/wps_symbol_fonts.zip)
md5sums=('b7dff8c0a26e802485384c38c6cb26c9')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 *.ttf *.TTF "${pkgdir}/usr/share/fonts/TTF"
}
