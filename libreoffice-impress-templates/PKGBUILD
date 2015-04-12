# Maintainer: Artur Sobierak <asobierak@gmail.com>
# Maintainer: Denis Moiseev <fystep@mail.ru>
# Maintainer: Tomáš Havlas <tomas.havlas@raven-systems.eu>
pkgname=libreoffice-impress-templates
pkgver=3.3
pkgrel=15.58
pkgdesc="Layouts for LibreOffice"
arch=('any')
license=('GPL')
url="http://opensuse.org/"
depends=(libreoffice)
makedepends=(rpmextract)
source=(http://download.opensuse.org/repositories/LibreOffice:/Factory/openSUSE_Factory/noarch/libreoffice-templates-presentation-layouts-${pkgver}-${pkgrel}.noarch.rpm)
md5sums=('4f78eb9c4141378b0d25242fda92125f')

package() {
  rpmextract.sh "libreoffice-templates-presentation-layouts-${pkgver}-${pkgrel}.noarch.rpm"
  mkdir -p "${pkgdir}/usr/lib/libreoffice/share/template"
  cp -R "${srcdir}/usr/share/templates/libreoffice/common" "${pkgdir}/usr/lib/libreoffice/share/template/"
}


