# Maintainer: Noctivivans <noctivivans@gmail.com>

pkgname=compal-laptop
pkgver=0.2.10
pkgrel=4
pkgdesc="Module for Compal laptops"
url="http://eko.one.pl/index.php?page=compal-laptop"
arch=('i686' 'x86_64')
license=('GPL')
_kernver=`uname -r`
source=("http://eko.one.pl/files/compal/${pkgname}-${pkgver}-old.tar.bz2" 'kernel-2.6.33.patch')
[ "$_kernver" = "2.6.34-ARCH" ] && source=("http://eko.one.pl/files/compal/${pkgname}-${pkgver}.tar.bz2")
depends=('kernel26-headers')
md5sums=('7039f589b8743d5f39304683b6e3bd6f' 'a56bce489ddf4bb20296f3a58b7b1c25')
[ "$_kernver" = "2.6.34-ARCH" ] && md5sums=('8e58501eea9fc24419207a6bfe9c1f8d')

build() {
       	INST=/lib/modules/$(uname -r)/kernel/drivers/platform/x86/
	cd ${startdir}/src/${pkgname}-${pkgver}
	[ "${_kernver}" = "2.6.33-ARCH" ] && patch -i ../kernel-2.6.33.patch 
        make || return 1
	#install module
	mkdir -p ${startdir}/pkg/${INST}
	cp compal-laptop.ko ${startdir}/pkg/${INST}/
}

