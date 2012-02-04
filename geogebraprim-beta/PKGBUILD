# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=geogebraprim-beta
_pkgname=geogebraprim
pkgver=1
pkgrel=1
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet - for primary school"
arch=('any')
url='http://www.geogebra.org/'
license=('custom')
depends=('geogebra-beta')
optdepends=('geogebra-thumbnail-kde')
install=('geogebraprim-beta.install')
source=(geogebraprim.sh
	geogebraprim.desktop
	http://www.geogebra.org/download/license.txt)

package() {
  cd $srcdir

  install -D -m755 ${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}
  
  # Creating menu item
  install -D -m644 ${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop

  # Installing license
  install -D -m644 license.txt ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}

md5sums=('431c6f0f14f8cb3287d964bb68f673f1'
         '05688cbe0b7bfb131dafb556060583ab'
         '442eb7f61494c48717bcc23f406ff8d5')
