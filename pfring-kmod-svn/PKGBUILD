# Maintainer: Thomas Marchsteiner <tommy[0x2e]m86[0x40]gmail[0x2e]com>
pkgname=pfring-kmod-svn
_pkgname=PF_RING
pkgver=20150208
pkgrel=1
pkgdesc="kernel module for packet capture at wirespeed"
url="http://www.ntop.org"
arch=('x86_64' 'i686')
license=('GPL')
depends=('numactl')
makedepends=('linux-headers' 'make' 'binutils' 'flex' 'bison' 'svn')
conflicts=('pfring-kmod')
provides=('pfring-kmod')
source=("svn+https://svn.ntop.org/svn/ntop/trunk/PF_RING/")
md5sums=('SKIP')


#pkgver() {
#   cd ${srcdir}
#   svnversion
#}

build() {
	cd "${srcdir}/${_pkgname}/kernel"
	./configure --prefix=/usr
	sed -i "s/INSTDIR\ \:=\ \$(DESTDIR)/INSTDIR := \$(DESTDIR)\/usr/g" Makefile
	make
}

package() {
	cd "${srcdir}/${_pkgname}/kernel"
	mkdir -p ${pkgdir}/usr/include/linux
	make DESTDIR="${pkgdir}" install
}
