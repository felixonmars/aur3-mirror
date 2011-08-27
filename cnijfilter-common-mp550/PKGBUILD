# Maintainer: Stefan Hackl <stef.hackl@gmail.com>

pkgname=cnijfilter-common-mp550
_pkgname=cnijfilter
pkgver=3.20
pkgrel=1
pkgdesc="Canon IJ Printer Driver (common package)"
url="http://software.canon-europe.com/products/0010757.asp"
arch=('i686' 'x86_64')
license=('custom')
provides=('cnijfilter-common')
if [ "${CARCH}" = 'x86_64' ]; then
  depends=('lib32-libcups' 'lib32-popt' 'lib32-glibc')
elif [ "${CARCH}" = 'i686' ]; then
  depends=('libcups' 'popt')
fi
makedepends=('rpmextract')
source=("http://files.canon-europe.com/files/soft37275/software/MP550_rpm_driver_pack.tar")
md5sums=('5d806a0b626cc6aff6f172b95e11e105')

build() {
  cd ${srcdir}
  install -d ${pkgdir}
  tar -xf MP550_rpm_driver_pack.tar
  tar -xf ${_pkgname}-mp550series-${pkgver}-1-i386-rpm.tar.gz
  cd ${_pkgname}-mp550series-${pkgver}-1-i386-rpm/packages
  rpmextract.sh ${_pkgname}-common-${pkgver}-1.i386.rpm
  mkdir -p usr/share/licenses/${_pkgname}
  cp usr/share/doc/cnijfilter-common-$pkgver/* usr/share/licenses/${_pkgname}
  rm -rf usr/share/doc
  chmod -R a+rX usr/
  cp -r "usr" ${pkgdir}
}