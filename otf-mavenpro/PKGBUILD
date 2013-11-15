# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>
# Contributor: Mike Redd <mredd@0tue0.com>

pkgname=otf-mavenpro
pkgver=1.003
pkgrel=3
pkgdesc="A sans-serif typeface with unique curvature and flowing rhythm"
arch=('any')
license=('custom:SIL Open Font License')
url="http://vissol.co.uk/mavenpro"
depends=('fontconfig')
makedepends=('unrtf')
install=${pkgname}.install

_realname=MavenPro
source=("http://vissol.co.uk/mavenpro/${_realname}.zip"
        "${_realname}-light.zip::http://www.losttype.com/delivery/${_realname}.zip")
md5sums=('17e8b5c3574cba8a735524337d6e8117'
         '210c046a5382896c2e3701e8379974ed')

package() {
  cd ${_realname}

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF"

  unrtf --text *.rtf | tail -14 > LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
