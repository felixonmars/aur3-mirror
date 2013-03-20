#Maintainer: Shaumux <shaumya "at" gmail {dot} com>
#Contributer: heaven <vo.zaeb at gmail.com>
pkgname=vmware-modules
pkgver=271.2
pkgrel=1
pkgdesc="VMware kernel modules"
arch=('i686' 'x86_64')
url="http://www.vmware.com/"
license=('GPL2')
conflicts=('open-vm-tools-modules')
_MINOR=$(echo ${pkgver} | cut -d . -f 2)
depends=("vmware-player=5.0.${_MINOR}")
makedepends=('linux-headers')
options=('!buildflags')
install=${pkgname}.install
source=('vmblock.tar' 'vmci.tar' 'vmmon.tar' 'vmnet.tar' 'vsock.tar' '271-putname.patch' '271-apic.patch' '60-vmware.rules')
sha256sums=('5fa33a15764f7bdfcab0f153ff7ac66c8b5d3fa1d50b6bc06a9082ada9ce69b9'
			'a30ad6965bd0bd2d7762fb0e12e288ebc6856242b5ee9ef978caee84d6fa11b7'
			'fa45f5ffafaaa6cce695a0862a7f3788a512fe3976ec913a161ea7eb5c9c2671'
			'3a01302c0681aea9466353b301d1e7a63bd6ba22c30c85f25c677b3a45e547fb'
			'260a0fab437e048c434944bba0217d410f8ee6a2e025953d1a8f286ec02f93b6'
			'b8103d3c72c24696e974e49dcdcdf2d5a2b2c2fdd5f6ca050842b840e906ba77'
			'60e7df881281fedcabe9ea4427b324b5e1142a1a2b6ab5236ac0843bd1051048'
			'654a11be0b0a6f0f4f8fdc32f8a92542cec637e0f6c62dd7097d3cf679c06f4d')
build() {
	_kernver=$(pacman -Q linux | cut -d . -f 2 | cut -f 1 -d -)
	VMWARE_MODULE_LIST="vmblock vmci vmmon vmnet vsock"
	patch -p1 < ${srcdir}/271-apic.patch
	#patch -p1 < ${srcdir}/271-makefile-dirs.patch
	chmod +w ${srcdir}/vmblock-only/linux/control.c
	[[ ${_kernver} -ge 7 ]] && patch -p1 < ${srcdir}/271-putname.patch
	for mod in ${VMWARE_MODULE_LIST}; do
		cd ${srcdir}/${mod}-only
		[[ ${mod} == 'vsock' ]] && cp ${srcdir}/vmci-only/Module.symvers ./
		make || return 1
	done
}

package() {
	_kernver=$(pacman -Q linux | cut -d . -f 2 | cut -f 1 -d -)
	depends=("linux>=3.${_kernver}" "linux<3.$(expr ${_kernver} + 1)")
	KERNEL_VERSION=$(cat /usr/lib/modules/extramodules-3.${_kernver}-ARCH/version)
	msg "Kernel = $KERNEL_VERSION"
	mkdir -p $pkgdir/usr/lib/modules/extramodules-3.${_kernver}-ARCH/
	cd "$srcdir"
	find -type f -name '*.ko' \
		-exec install -t "$pkgdir/usr/lib/modules/extramodules-3.$_kernver-ARCH" {} +
	gzip "$pkgdir/usr/lib/modules/extramodules-3.$_kernver-ARCH"/*.ko
	install -D -m0644 "$srcdir"/60-vmware.rules "$pkgdir"/etc/udev/rules.d/60-vmware.rules
}