# Maintainer: mutlu_inek@yahoo.de

pkgname=geoexpress
_pkgname=GeoExpressCLUtils
pkgver=8.5.0.3330
pkgrel=1
pkgdesc="Command Line Utilities for editing LizardTech's MrSID (.sid) raster image files and converting them into other file formats"
arch=(i686 x86_64)
url="http://www.lizardtech.com/downloads/tools.php"
license=('custom')
depends=('gcc-libs')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
install=geoexpress.install
options=(!strip)
source=(http://bin.us.lizardtech.com/${pkgname}_commandlineutils_linux.tgz)
md5sums=('d48ab97cfa5528b2dd4f8f39eac7aec7')
[ "$CARCH" = "i686" ] && _archpath=linux32
[ "$CARCH" = "x86_64" ] && _archpath=linux64

package() {
   cd $srcdir/${_archpath}
   tar -xvf ${_pkgname}-${pkgver}.tar
   cd ${_pkgname}-${pkgver}
   mkdir -p ${pkgdir}/usr/bin
   cp bin/mrsid* ${pkgdir}/usr/bin/
   mkdir -p ${pkgdir}/usr/lib
   cp -d bin/lib* ${pkgdir}/usr/lib/
   cp -r libproject/libproj.* ${pkgdir}/usr/lib/
   mkdir -p ${pkgdir}/usr/lib/${pkgname}
   cp -r libproject/nad/proj/* ${pkgdir}/usr/lib/${pkgname}/
   mkdir -p ${pkgdir}/usr/share/${pkgname}
   cp -r libproject/data/* ${pkgdir}/usr/share/${pkgname}/
   cp -r libproject/nad/man ${pkgdir}/usr/share/
   install -Dm644 $srcdir/${_archpath}/${_pkgname}-${pkgver}/license.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

export PROJSO=/usr/lib
export GDAL_DATA=/usr/share/geoexpress
}
