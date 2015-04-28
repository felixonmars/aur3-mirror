# Maintainer: Robert Mackanics <schnoopay@gmx.com>

pkgname="libreoffice-still-en-us-help"
pkgver=4.3.7
pkgrel=1
pkgdesc="en-US offline help for Libreoffice"
arch=('any')
url="http://www.documentfoundation.org"
license=('LGPL')
makedepends=('rpmextract')
conflicts=('libreoffice-fresh-en-us-help')
replaces=('libreoffice-en-us-help')
source=("http://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/x86/LibreOffice_${pkgver}_Linux_x86_rpm_helppack_en-US.tar.gz")

prepare() {
rpmextract.sh ${srcdir}/LibreOffice_$pkgver*_Linux_x86_rpm_helppack_en-US/RPMS/*.rpm
}

package() {
  mkdir -p "$pkgdir"/usr/lib/libreoffice/
  cp -R opt/libreoffice*/* "$pkgdir"/usr/lib/libreoffice

}
sha256sums=('f0c98488e97abe79422a52170d22a99f0438e17964961bb1a4fc05fd4ca7ca0c')
