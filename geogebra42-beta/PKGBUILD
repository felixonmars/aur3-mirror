# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=geogebra42-beta
_varpkgname=geogebra
pkgver=4.1.75.0
pkgrel=1
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"
arch=('any')
url='http://www.geogebra.org/'
license=('custom:GPL and CCPL:by-sa')
# Application and source code under GPL / Language files under CCPL:by-sa
depends=('java-runtime' 'desktop-file-utils' 'xdg-utils')
optdepends=('kde-thumbnailer-geogebra: generates thumbnails of GeoGebra files in KDE'
	    'gnome-thumbnailer-geogebra: generates thumbnails of GeoGebra files in GNOME'
	    'geogebra42-beta-prim: adds a menu entry for the primary school version')
install='geogebra42-beta.install'
source=("http://geogebra.googlecode.com/files/GeoGebra-Unixlike-Installer-${pkgver}.tar.gz"
	"${pkgname}.patch"
	"${pkgname}.desktop.patch")
md5sums=('c460fc72177e943355a9877098628b78'
         '91a4aa931ef4c6cee539af2158d11a0e'
         'ea0f1ee6f3d8afef2122f8b2a9aac8ac')

package() {
  cd "${srcdir}/${_varpkgname}-${pkgver}"

  # Installing application
  #rm jython.jar unsigned/jython.jar
  install -d -m755 "${pkgdir}/usr/share/java/${pkgname}/unsigned"
  install -D -m644 *.jar "${pkgdir}/usr/share/java/${pkgname}"
  install -D -m644 unsigned/*.jar "${pkgdir}/usr/share/java/${pkgname}/unsigned"
  patch -p0 < "${srcdir}/${pkgname}.patch"
  patch -p0 < "${srcdir}/${pkgname}.desktop.patch"
  install -d -m755 "${pkgdir}/usr/bin"
  install -D -m755 "${_varpkgname}" "${pkgdir}/usr/bin/${pkgname}"
  #ln -s "/opt/jython/jython.jar" \
  #  "${pkgdir}/usr/share/java/${pkgname}/jython.jar"
  #ln -s "/opt/jython/jython.jar" \
  #  "${pkgdir}/usr/share/java/${pkgname}/unsigned/jython.jar"
  

  # Creating menu item
  install -D -m644 "icons/hicolor/64x64/apps/${_varpkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -D -m644 "${_varpkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Installing license
  install -D -m644 _LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
