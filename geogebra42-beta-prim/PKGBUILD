# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=geogebra42-beta-prim
pkgver=1
pkgrel=1
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet - for primary school"
arch=('any')
url='http://www.geogebra.org/'
license=('CCPL:by-sa')
depends=('geogebra42-beta')
install='geogebra42-beta-prim.install'
source=($pkgname.sh
	$pkgname.desktop)
md5sums=('eebf3fc6793d3c53028beac1aaad727f'
         'fef56ba23332cf77f426b61f0c1da973')

package() {
  cd ${srcdir}

  # Installing launch script
  install -D -m755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  
  # Creating menu item
  install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
