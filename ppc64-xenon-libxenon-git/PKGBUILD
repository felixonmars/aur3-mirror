# Maintainer: Moritz Fischer <aur@pure-entropy.org>
pkgname=ppc64-xenon-libxenon-git
pkgver=20110916
pkgrel=1
pkgdesc="legal homebrew @ xbox 360"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('git' 'libmpc' 'mpfr' 'gettext' 'ppc64-xenon-binutils' 'ppc64-xenon-newlib' 'ppc64-xenon-gcc-elf')
provides=('ppc64-xenon-libxenon')
url="http://free60.org"
options=(!strip !buildflags)

conflicts=()

_gitroot=git://free60.git.sourceforge.net/gitroot/free60/free60
_gitname=free60



build() {
	cd ${srcdir}

	if [ -d $_gitname ]; then
		cd $_gitname && git reset HEAD --hard && git clean -x -d -f && git pull origin
		msg "Updated the local files."
	else
		git clone $_gitroot
		msg "GIT checkout done or server timeout"
	fi

	cd ${srcdir}
	export DEVKITXENON=/usr/xenon

	make -C $_gitname/libxenon/ports/xenon libxenon.a || return 1
}

package() {
	cd $_gitname/libxenon/ports/xenon
	mkdir -p ${pkgdir}/usr/xenon/lib
	cp libxenon.a ${pkgdir}/usr/xenon/lib/
	mkdir -p ${pkgdir}/usr/xenon/include/libxenon
	cp -r ../../drivers/* ${pkgdir}/usr/xenon/include/libxenon
	cp ../../include/* ${pkgdir}/usr/xenon/include/libxenon
	mkdir -p ${pkgdir}/usr/xenon/include/libxenon/lwip
	cp ../../drivers/lwip/include/lwip/* ${pkgdir}/usr/xenon/include/libxenon/lwip/
	cp ../../drivers/lwip/include/ipv4/lwip/* ${pkgdir}/usr/xenon/include/libxenon/lwip/
	mkdir -p ${pkgdir}/usr/xenon/include/libxenon/netif/
	cp ../../drivers/lwip/include/netif/* ${pkgdir}/usr/xenon/include/libxenon/netif/
	mkdir -p ${pkgdir}/usr/xenon/include/libxenon/arch/
	cp ../../drivers/lwip/xenon/include/arch/* ${pkgdir}/usr/xenon/include/libxenon/arch/
	mkdir -p ${pkgdir}/usr/xenon/include/libxenon/sys/
	cp ../../drivers/newlib/dirent.h ${pkgdir}/usr/xenon/include/libxenon/sys
	find ${pkgdir}/usr/xenon/include/ -type f \! -name "*.h" -delete
	cd ${srcdir}
	cp  $_gitname/devkitxenon/app.lds free60/devkitxenon/rules ${pkgdir}/usr/xenon
	# startup crt fix
	cp $_gitname/libxenon/startup/xenon/crt1.o ${pkgdir}/usr/xenon/lib/
	cp $_gitname/libxenon/ports/xenon/crti.o ${pkgdir}/usr/xenon/lib/
	cp $_gitname/libxenon/ports/xenon/crtn.o ${pkgdir}/usr/xenon/lib/
	sed -i -e 's#/usr/include#/include/libxenon#g' ${pkgdir}/usr/xenon/rules
	sed -i -e 's#/usr/lib#/lib/32#g' ${pkgdir}/usr/xenon/rules
	msg 'Please add an export DEVKITXENON="/usr/xenon" to your environment'
}

