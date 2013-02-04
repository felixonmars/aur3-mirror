# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=dkms-vhba
_pkgname=vhba-module
_module=vhba
pkgver=20120422
pkgrel=4
pkgdesc="DKMS controlled drivers for VHBA module for CDEMU"
arch=('any')
url="http://cdemu.sourceforge.net/"
license=('GPL2')
depends=('dkms' 'bash')
provides=('vhba-module' "vhba-module=${pkgver}")
conflicts=('vhba-module')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/cdemu/${_pkgname}-${pkgver}.tar.bz2"
        'dkms.conf'
        '60-vhba.rules')
md5sums=('d97372da1d270d1605742b2995fb6678'
         'affb647653175864123b0d7abd382746'
         'b5e82d0160e7a181219b67c1794d5c27')

build() {
  rm -fr "${srcdir}/${_pkgname}-build"
  cp -R "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/${_pkgname}-build"
}

package() {
  cd "${srcdir}/${_pkgname}-build"

  install -Dm644 vhba.c "${pkgdir}/usr/src/${_module}-${pkgver}/vhba.c"
  install -Dm644 Makefile "${pkgdir}/usr/src/${_module}-${pkgver}/Makefile"
  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_module}-${pkgver}/dkms.conf"
  install -Dm644 "${srcdir}/60-vhba.rules" "${pkgdir}/usr/lib/udev/rules.d/60-vhba.rules"
  sed "s|@VERSION@|${pkgver}|g" -i "${pkgdir}/usr/src/${_module}-${pkgver}/dkms.conf"
}
