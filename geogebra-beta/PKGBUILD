# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=geogebra-beta
_pkgname=geogebra
pkgver=3.9.397.0
pkgrel=1
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"
arch=('any')
url='http://www.geogebra.org/'
license=('custom')
# Application and source code under GPL / Language files under CCPL:by-sa
depends=('java-runtime' 'shared-mime-info' 'hicolor-icon-theme')
provides=('geogebra')
optdepends=('geogebra-thumbnail-kde')
conflicts=('geogebra')
install=('geogebra-beta.install')
source=(http://geogebra.googlecode.com/files/GeoGebra-Unixlike-Installer-${pkgver}.tar.gz
	geogebra.patch
	geogebra_desktop.patch)
noextract=('*.jar')

package() {
  cd $srcdir/${_pkgname}-$pkgver

  # Installing application
  install -d -m755 $pkgdir/usr/share/java/${_pkgname}/unsigned
  install -D -m644 *.jar $pkgdir/usr/share/java/${_pkgname}
  install -D -m644 unsigned/*.jar $pkgdir/usr/share/java/${_pkgname}/unsigned
  patch -p0 < ${srcdir}/geogebra.patch
  patch -p0 < ${srcdir}/geogebra_desktop.patch
  install -d -m755 ${pkgdir}/usr/bin
  install -D -m755 ${_pkgname} $pkgdir/usr/bin/${_pkgname}

  # Copying icons
  cp -R icons $pkgdir/usr/share/
  
  # Creating menu item
  install -D -m644 ${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop

  # Installing mime-type
  install -D -m644 ${_pkgname}.xml $pkgdir/usr/share/mime/packages/${_pkgname}.xml

  # Installing license
  install -D -m644 _LICENSE.txt ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}

md5sums=('7298cf3e029e2e1eb459cf9f9980cc4f'
         'd064564e74a3982f811193e056c0f22c'
         '4cfc7354902ce2375dc31ec8687bd379')
