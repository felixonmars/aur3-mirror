# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=geogebra-beta-maxima
_pkgname=geogebra-maxima
pkgver=1
pkgrel=1
epoch=1
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet - with Maxima as CAS"
arch=('any')
url='http://www.geogebra.org/'
license=('custom')
depends=('geogebra-beta' 'maxima')
optdepends=('geogebra-thumbnail-kde')
install=('geogebra-beta-maxima.install')
source=(${pkgname}.sh
	${pkgname}.desktop
	http://www.geogebra.org/download/license.txt)

package() {
  cd $srcdir

  install -D -m755 ${pkgname}.sh $pkgdir/usr/bin/${_pkgname}
  
  # Creating menu item
  install -D -m644 ${pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop

  # Installing license
  install -D -m644 license.txt ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}

md5sums=('344ee90f85d74e45ba0fb18c4d56db29'
         '48849626188416403b3eb5a8f62768d3'
         '442eb7f61494c48717bcc23f406ff8d5')
