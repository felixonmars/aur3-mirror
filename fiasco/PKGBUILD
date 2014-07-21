# Mantainer Andrei Zaikin (andzai1995@gmail.com)

pkgbase=fiasco
pkgname=${pkgbase}-svn

pkgver=3.14

pkgdesc="Fiasco.OC L4 microkernel"
depends=('coreutils')
optdepends=('crda: to set the correct wireless channels of your country')

pkgrel=3
url="http://os.inf.tu-dresden.de/fiasco/"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('gcc48' 'perl' 'binutils' 'subversion' 'make' 'gawk' 'pkg-config') 
options=(!strip)

#http://os.inf.tu-dresden.de/download/snapshots-oc/
#configs = Arch linux configs + ACPI and PM removed
source=('globalconfig.32' 'globalconfig.64')

md5sums=( 'd77f71a516442b82c74c6de99f60424e' '083b764da087480235deba00b2960d27')

export KARCH=x86


prepare() {
	#decide on which configs to use
	if [ ${CARCH} == x86_64 ]; then
	  _fiasconfig=${srcdir}/globalconfig.64
	else
	  _fiasconfig=${srcdir}/globalconfig.32
	fi
	_src="${srcdir}/${pkgname}/src"

	msg "getting sources"
	mkdir -p ${srcdir}/${pkgname}
	cd ${srcdir}/${pkgname}
	svn cat http://svn.tudos.org/repos/oc/tudos/trunk/repomgr | perl - init http://svn.tudos.org/repos/oc/tudos fiasco

	msg "prepare fiasco"
	mkdir -p ${_src}/kernel/fiasco
	cd ${_src}/kernel/fiasco
	rm -rf ${srcdir}/build
	make BUILDDIR="${srcdir}/build/fiasco"
	cp ${_fiasconfig} ${srcdir}/build/fiasco/globalconfig.out
	cd ${srcdir}/build/fiasco
	make oldconfig
	make menuconfig
	#alternatively: make menuconfig
}

build() {
	msg "build fiasco"
	cd ${srcdir}/build/fiasco
	make
}

package() {
	msg "package fiasco"
	mkdir -p ${pkgdir}/boot/l4
	install -m755 ${srcdir}/build/fiasco/fiasco ${pkgdir}/boot/l4/
}
