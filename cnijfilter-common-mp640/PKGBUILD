pkgname=cnijfilter-common-mp640
_pkgname=cnijfilter
pkgver=3.20
pkgrel=1
pkgdesc="Canon IJ Printer Driver (common package)"
url="http://software.canon-europe.com/products/0010757.asp"
arch=('i686' 'x86_64')
license=('custom')
provides=('cnijfilter-common')
if [ "${CARCH}" = 'x86_64' ]; then
  depends=('lib32-libcups' 'lib32-popt')
elif [ "${CARCH}" = 'i686' ]; then
  depends=('libcups' 'popt')
fi
makedepends=('rpmextract')
source=(http://files.canon-europe.com/files/soft37273/software/MP640_rpm_driver_pack.tar)
md5sums=('44cc20ef41db260464c00bbfd6fd3793')

build() {
  cd ${srcdir}
  install -d ${pkgdir}
  tar -xf MP640_rpm_driver_pack.tar
  tar -xf ${_pkgname}-mp640series-${pkgver}-1-i386-rpm.tar.gz
  cd ${_pkgname}-mp640series-${pkgver}-1-i386-rpm/packages
  rpmextract.sh ${_pkgname}-common-${pkgver}-1.i386.rpm
  mkdir -p usr/share/licenses/${_pkgname}
  mv usr/share/doc/cnijfilter-common-$pkgver/* usr/share/licenses/${_pkgname}
  rm -rf usr/share/doc
  chmod -R a+rX usr/
  mv "usr" ${pkgdir}
}
