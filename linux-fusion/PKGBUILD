# Contributor: lks <lukasgreatz [et] web [dot] de>
# Contributor: bountykiller <masse.nicolas@gmail.com>
# Contributor: Georgios Tsalikis <aliverius@tsalikis.net>
# Contributor:	Jesse Jaara <gmail.com: jesse.jaara>      

_pkgname=linux-fusion
pkgbase=linux-fusion
pkgver=9.0.3
pkgrel=1
pkgdesc="Kernel module providing the IPC for DirectFB multi-app, FusionSound & FusionDale"
arch=(armv7h i686 x86_64)
url="http://www.directfb.org"
license="GPL2"
depends=()
makedepends=()
install=${_pkgname}.install
source=(http://www.directfb.org/downloads/Core/${_pkgname}/${_pkgname}-${pkgver}.tar.gz 
	30-fusion.rules
        .SRCINFO)
md5sums=('f42a089ea3f649b9ab3a98d812ce1821'
         '3c78337fceaa897d536a93ae840cdd19'
         SKIP)


### To build for a kernel, other than the one in use ###
### Please set its name here.			     ###
kversion=`uname -r`
##
if [ "${kversion#*-*-}" =  "" ] 
  then _kernelname=""
  else _kernelname="-${kversion#*-*-}"
fi
pkgname=("linux-fusion-core" "linux${_kernelname}-fusion")

build () {
	cd ${srcdir}/${_pkgname}-${pkgver}

	make KERNEL_VERSION="${kversion}" modules
}

package_linux-fusion-core() {
        conflicts=("linux-fusion<=9.0.3-1")
	install -D -m644 "${srcdir}/${_pkgname}-${pkgver}/linux/include/linux/fusion.h" "${pkgdir}/usr/include/linux/fusion.h"
	install -D -m644 "${srcdir}/30-fusion.rules" "${pkgdir}/etc/udev/rules.d/30-fusion.rules"
}

_package() {
        #depends="linux${_kernelname}"
        provides=("linux-fusion==${pkgver}")
        conflicts=("linux-fusion<=9.0.3-1")
	install -D -m644 "${srcdir}/${_pkgname}-${pkgver}/linux/drivers/char/fusion/fusion.ko" \
				"${pkgdir}/usr/lib/modules/${kversion}/kernel/drivers/char/fusion.ko"
	gzip "${pkgdir}/usr/lib/modules/${kversion}/kernel/drivers/char/fusion.ko"
}

eval "package_linux${_kernelname}-fusion() {
    _package
}"

