# Maintainer: Ignacio Galmarino <igalmarino@gmail.com>

pkgname=springsource-tool-suite
pkgver=2.8.1
_eclipse_pkgver=e3.7.1
_eclipse_pkgver_short=e3.7
pkgrel=2
pkgdesc="SpringSource Tool Suite"
arch=('i686' 'x86_64')
url="http://www.springsource.com/developer/sts"
depends=('java-environment' 'gtk2' 'unzip' 'libwebkit')
install=${pkgname}.install
makedepends=('zip')
license=("EPL/1.1")
source=("http://download.springsource.com/release/STS/${pkgver}/dist/${_eclipse_pkgver_short}/${pkgname}-${pkgver}.RELEASE-${_eclipse_pkgver}-linux-gtk.tar.gz"
	"${pkgname}.xpm"
	"${pkgname}.desktop")
md5sums=('7b205678bd01a61cb8456ff75946cfd8'
         'bd1da8bceeb4ae06cdd85759ed654982'
         '9bbe43942c2cad54ca467ff5bebde8e9')
[ "$CARCH" = "x86_64" ] && source[0]="http://download.springsource.com/release/STS/${pkgver}/dist/${_eclipse_pkgver_short}/${pkgname}-${pkgver}.RELEASE-${_eclipse_pkgver}-linux-gtk-x86_64.tar.gz"
[ "$CARCH" = "x86_64" ] && md5sums[0]='7b205678bd01a61cb8456ff75946cfd8'

package() {
  cd "${srcdir}/springsource"

  # install eclipse
  install -m755 -d "${pkgdir}/opt"
  mv "${srcdir}/springsource" "${pkgdir}/opt/springsource"

  # install misc
  install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/applications
  install -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  ln -s "/opt/springsource/sts-${pkgver}.RELEASE/STS" ${pkgdir}/usr/bin/STS

  # install icon
  install -Dm644 ${srcdir}/${pkgname}.xpm ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.xpm
}
