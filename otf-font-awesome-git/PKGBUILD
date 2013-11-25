pkgname=otf-font-awesome-git
pkgver=4.0.3
pkgrel=2
pkgdesc="The iconic font designed for Bootstrap"
arch=('any')
url="http://fontawesome.io"
license=('SIL OFL 1.1')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(https://raw.github.com/FortAwesome/Font-Awesome/master/fonts/FontAwesome.otf)
md5sums=('SKIP')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
}
