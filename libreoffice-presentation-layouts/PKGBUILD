# Maintainer: Denis Moiseev <fystep@mail.ru>
pkgname=libreoffice-presentation-layouts
pkgver=3.3
pkgrel=5.2
_rpm=libreoffice-templates-presentation-layouts-3.3-5.2.noarch.rpm
pkgdesc="Layouts for LibreOffice"
arch=('any')
license=('GPL')
url="http://opensuse.org/"
depends=(libreoffice)
makedepends=(rpmextract)
source=(http://download.opensuse.org/repositories/LibreOffice:/Stable/openSUSE_11.4/noarch/$_rpm)
md5sums=('09c9a87478a5f5fc4b4a4dbab72cd8d1')
package() {
  rpmextract.sh $_rpm
  cp -r usr/ "$pkgdir"
}