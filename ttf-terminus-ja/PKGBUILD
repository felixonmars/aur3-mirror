# Maintainer: polamjag <s@polamjag.info>

pkgname=ttf-terminus-ja
pkgver=20100612
pkgrel=1
pkgdesc="Japanese monospace font based on Terminus and IPA Gothic which has bitmap image"
arch=('any')
url="http://mix-mplus-ipa.sourceforge.jp/mplus2006_ipa2003/terminus-ja/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
_mirror="iij"
source=(http://${_mirror}.dl.sourceforge.jp/mix-mplus-ipa/47837/terminus-ja-courier-bitmap-ja-${pkgver}.zip)
md5sums=('9db6f3a43c0cc42981b5920fc81effae')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -m644 "terminus-ja-courier-bitmap-ja-${pkgver}"/opfc-ModuleHP-1.1.1_withIPAFonts/fonts/Terminus-ja.ttf "${pkgdir}/usr/share/fonts/TTF"
}
