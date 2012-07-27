# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=otf-ipafont
pkgver=003.03
_pkgver=${pkgver/./}
pkgrel=2
pkgdesc="Japanese outline fonts by Information-technology Promotion Agency, Japan (IPA)"
arch=('any')
url="http://ossipedia.ipa.go.jp/ipafont/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
changelog=ChangeLog
install=otf.install
source=(http://info.openlab.ipa.go.jp/ipafont/fontdata/IPAfont${_pkgver}.zip)
md5sums=('39a828acf27790adbe4944dfb4d94bb1')

package() {
  cd "${srcdir}/IPAfont${_pkgver}"

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 IPA_Font_License_Agreement_v1.0.txt \
                Readme_IPAfont${_pkgver}.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}

