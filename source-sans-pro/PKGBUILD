# Maintainer: Philip May <eniak DOT info AT gmail DOT com>
pkgname=source-sans-pro
pkgver=1.034
pkgrel=1
pkgdesc="This is Adobe's first open source font family, conceived primarily as a typeface for user interfaces."
arch=('any')
url="http://sourceforge.net/projects/sourcesans.adobe/"
license=('custom')
#groups=()
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
#makedepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
install=source-sans-pro.install
#changelog=
source=(http://sourceforge.net/projects/sourcesans.adobe/files/SourceSansPro_FontsOnly-${pkgver}.zip)
#noextract=()
md5sums=('269ee3ae71a87eb0ca4ebb0a66b0e198')

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF
  cd ${srcdir}/SourceSansPro_FontsOnly-${pkgver}
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
