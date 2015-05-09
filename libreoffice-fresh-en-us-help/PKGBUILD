# Maintainer: Robert Mackanics <schnoopay@gmx.com>

pkgname="libreoffice-fresh-en-us-help"
pkgver=4.4.3
pkgrel=1
pkgdesc="en-US offline help for Libreoffice Fresh"
arch=('any')
url="http://www.documentfoundation.org"
license=('LGPL')
makedepends=('rpmextract')
conflicts=('libreoffice-en-us-help')
source=("http://download.documentfoundation.org/libreoffice/stable/${pkgver}/rpm/x86/LibreOffice_${pkgver}_Linux_x86_rpm_helppack_en-US.tar.gz")

prepare() {
rpmextract.sh ${srcdir}/LibreOffice_$pkgver*_Linux_x86_rpm_helppack_en-US/RPMS/*.rpm
}

package() {
  mkdir -p "$pkgdir"/usr/lib/libreoffice/
  cp -R opt/libreoffice*/* "$pkgdir"/usr/lib/libreoffice

}
sha256sums=('0290991d6ff92216769b1f0339e97947a115f2d157e8424e62f3c4d02d90ae6b')
