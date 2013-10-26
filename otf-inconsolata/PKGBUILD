pkgname=otf-inconsolata
pkgver=1.0
pkgrel=1
pkgdesc="Monospace font, designed for code listings and the like, in print"
arch=('any')
url="http://www.levien.com/type/myfonts/inconsolata.html"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(http://www.levien.com/type/myfonts/Inconsolata.otf)
md5sums=('0fbe014c1f0fb5e3c71140ff0dc63edf')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
}
