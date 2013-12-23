# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=otf-norwester
pkgver=1.2
pkgrel=1
pkgdesc="A condensed geometric sans serif"
arch=('any')
url="http://jamiewilson.io/norwester/"
license=('custom:SIL Open Font License')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=(http://jamiewilson.io/norwester/assets/norwester.zip)

package() {
  cd "${srcdir}/norwester-v${pkgver}"

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('6dbd8a89e9db2b9b646e57959db38689')
