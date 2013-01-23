# Maintainer: blackleg <hectorespertpardo@gmail.com>
# Based in compat-drivers-patched package

#pkgname=rtl8723ae-w110er
pkgname=rtl8723ae
pkgver=3.7
_upver="2012-12-19-u"
pkgrel=4
#pkgdesc="Kernel module for the rtl8723ae and others. (Linux-w110er kernel)"
pkgdesc="Kernel module for the rtl8723ae and others."
url='https://backports.wiki.kernel.org/index.php/Main_Page'
arch=("any")
license=('GPL')
#depends=("linux-w110er>=${pkgver}" "linux-w110er<3.8" "linux-firmware")
depends=("linux>=${pkgver}" "linux<3.8" "linux-firmware")
#makedepends=("linux-w110er-headers" "linux-api-headers")
makedepends=("linux-headers" "linux-api-headers")
provides=("rtl8723ae")
source=("http://www.kernel.org/pub/linux/kernel/projects/backports/2012/12/19/compat-drivers-${_upver}.tar.bz2" "rtl8723ae.patch")

md5sums=('60756fde830487042a525ff17ccfe7ab'
         'f796e278131e5912a81ccde032890c04')


#_extramodules=extramodules-${pkgver}-w110er
_extramodules=extramodules-${pkgver}-ARCH

_kernver=$(cat /usr/lib/modules/${_extramodules}/version)

install=rtl8723e.install



build() {
	cd "${srcdir}"
	patch -p0 < rtl8723ae.patch
	cd "${srcdir}/compat-drivers-${_upver}"
	make ${MAKEFLAGS} KLIB=/usr/lib/modules/"${_kernver}"
}

package() {
	cd "${srcdir}/compat-drivers-${_upver}"
  	mkdir ${pkgdir}/usr/
	make INSTALL_MOD_PATH="${pkgdir}/usr" KMODDIR=../"${_extramodules}" install-modules
	find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;

}
