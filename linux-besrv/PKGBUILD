# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

_kernelname=-besrv
pkgbase="linux${_kernelname}"
pkgname="linux${_kernelname}"
true && pkgname=("linux${_kernelname}" "linux${_kernelname}-headers")
_basekernel=3.0
_patchver=8
pkgver=${_basekernel}
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.kernel.org"
options=(!strip)

source=(
	"http://www.kernel.org/pub/linux/kernel/v3.0/linux-${_basekernel}.tar.bz2"
	# the main kernel config files
	"config-${_basekernel}-server.i686"
	"config-${_basekernel}-server.x86_64"
	# standard config files for mkinitcpio ramdisk
	"linux${_kernelname}.preset"
)
sha256sums=(
	'64b0228b54ce39b0b2df086109a7b737cde58e3df4f779506ddcaccee90356a0'
	'b79b0f14a3352c3bb457a7da685265504f0d6e4e321d974fd4e5a82ca7640b17'
	'7bd76bc5b5c4a21f0a778cccf2ade3ed0be4d05834a1b21bf781682fabc03d00'
	'64b2cf77834533ae7bac0c71936087857d8787d0e2a349037795eb7e42d23dde'
)
# revision patches
if [ ${_patchver} -ne 0 ]; then
	pkgver=${_basekernel}.${_patchver}
	_patchname="patch-${pkgver}"
	source=( "${source[@]}"
		"http://www.kernel.org/pub/linux/kernel/v3.0/${_patchname}.gz"
	)
	sha256sums=( "${sha256sums[@]}"
		'e063823ca2f9deafe969b942823dc087909d1be07305edd4f3faadb19b0acf14'
	)
fi

# extra patches
_extrapatches=(
	"http://grsecurity.net/test/pax-linux-3.0.8-test41.patch"
)
_extrapatchessums=(
	'1261781de11ce3474d92b57a8d674b6a1de37e6995465e2b7b7f6ac5d5676c30'
)
if [ ${#_extrapatches[@]} -ne 0 ]; then
	source=( "${source[@]}"
		"${_extrapatches[@]}"
	)
	sha256sums=( "${sha256sums[@]}"
		"${_extrapatchessums[@]}"
	)
fi

# some stuff for the AUR parser :p
if [ "aur" == "there" ]; then
	source=("ftp://ftp.kernel.org/pub/linux/kernel/v3.0/linux-${_basekernel}.tar.bz2"
			"config-${_basekernel}-server.i686"
			"config-${_basekernel}-server.x86_64"
			"linux${_kernelname}.preset"
	)
fi

build() {
	cd ${srcdir}/linux-${_basekernel}
	# Add revision patches
	if [ ${_patchver} -ne 0 ]; then
		msg2 "apply ${_patchname}"
		patch -Np1 -i ${srcdir}/${_patchname}
	fi

	# extra patches
	for patch in ${_extrapatches[@]}; do
		patch=$(basename ${patch})
		msg2 "apply ${patch}"
		patch -Np1 -i ${srcdir}/${patch}
	done

	# set configuration
	msg2 "copy configuration"
	if [ "$CARCH" = "x86_64" ]; then
		cat ../config-${_basekernel}-server.x86_64 >./.config
	else
		cat ../config-${_basekernel}-server.i686 >./.config
	fi
	if [ "${_kernelname}" != "" ]; then
		sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"\U${_kernelname}\"|g" ./.config
	fi

	# set extraversion to pkgrel
	msg2 "set extraversion to ${pkgrel}"
	sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

	# hack to prevent output kernel from being marked as dirty or git
	msg2 "apply hack to prevent kernel tree being marked dirty"
	echo "" > ${srcdir}/linux-${_basekernel}/.scmversion

	# get kernel version
	msg2 "prepare"
	make prepare
	# load configuration
	# Configure the kernel. Replace the line below with one of your choice.
	#make menuconfig # CLI menu for configuration
	#make xconfig # X-based configuration
	#make oldconfig # using old config from previous kernel version
	# ... or manually edit .config
	####################
	# stop here
	# this is useful to configure the kernel
	#msg "Stopping build"
	#return 1
	####################
	# yes "" | make config
	# build!
	msg2 "build"
	make ${MAKEFLAGS} bzImage modules
}

package_linux-besrv() {
	pkgdesc="The Linux Kernel and modules, BlackEagle Server Edition"
	groups=('base')
	provides=('linux' 'linux-firmware')
	backup=(
		"etc/mkinitcpio.d/${pkgname}.preset"
	)
	depends=('coreutils' 'module-init-tools>=3.12-2' 'mkinitcpio>=0.7')
	optdepends=(
		'crda: to set the correct wireless channels of your country'
	)
	replaces=(
		'nouveau-drm' 'kernel26-slk' "kernel26${_kernelname}" "linux-bemm"
	)
	conflicts=('linux-firmware')

	install=${pkgname}.install

	KARCH=x86
	cd ${srcdir}/linux-${_basekernel}

	mkdir -p ${pkgdir}/{lib/modules,lib/firmware,boot}

	# get kernel version
	_kernver=$(make kernelrelease)

	# install modules
	make INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=${pkgdir} modules_install

	# copy System.map and bzImage
	cp System.map ${pkgdir}/boot/System.map${_kernelname}
	cp arch/$KARCH/boot/bzImage ${pkgdir}/boot/vmlinuz${_kernelname}

	# install fallback mkinitcpio.conf file and preset file for kernel
	install -m644 -D ${srcdir}/${pkgname}.preset ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset

	# set correct depmod command for install
	sed \
		-e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
		-e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
		-i $startdir/${pkgname}.install
	sed \
		-e "s|source .*|source /etc/mkinitcpio.d/${pkgname}.kver|g" \
		-e "s|default_image=.*|default_image=\"/boot/initramfs${_kernelname}.img\"|g" \
		-e "s|fallback_image=.*|fallback_image=\"/boot/initramfs${_kernelname}-fallback.img\"|g" \
		-i ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset

	echo -e "# DO NOT EDIT THIS FILE\nALL_kver='${_kernver}'" > ${pkgdir}/etc/mkinitcpio.d/${pkgname}.kver

	# remove build and source links
	rm -f ${pkgdir}/lib/modules/${_kernver}/{source,build}

	_fldkernelname=$(echo ${_kernelname} | tr "[:lower:]" "[:upper:]")
	# make room for external modules
	ln -s "../${_basekernel}${_fldkernelname}-external" "${pkgdir}/lib/modules/${_kernver}/external"
	# add real version for building modules and running depmod from post_install/upgrade
	mkdir -p "${pkgdir}/lib/modules/${_basekernel}${_fldkernelname}-external"
	echo "${_kernver}" > "${pkgdir}/lib/modules/${_basekernel}${_fldkernelname}-external/version"

	# gzip all modules
	find ${pkgdir} -name '*.ko' -exec gzip -9 {} \;
}

package_linux-besrv-headers() {
	pkgdesc="Header files and scripts for building modules for linux${_kernelname}"
	provides=('linux-headers')
	replaces=("kernel26${_kernelname}-headers" "linux-bemm-headers")
	mkdir -p ${pkgdir}/lib/modules/${_kernver}
	cd ${pkgdir}/lib/modules/${_kernver}
	ln -sf ../../../usr/src/linux-${_kernver} build
	cd ${srcdir}/linux-${_basekernel}
	install -D -m644 Makefile \
		${pkgdir}/usr/src/linux-${_kernver}/Makefile
	install -D -m644 kernel/Makefile \
		${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
	install -D -m644 .config \
		${pkgdir}/usr/src/linux-${_kernver}/.config

	# copy files necessary for later builds, like nvidia and vmware
	cp Module.symvers ${pkgdir}/usr/src/linux-${_kernver}
	cp -a scripts ${pkgdir}/usr/src/linux-${_kernver}
	# fix permissions on scripts dir
	chmod og-w -R ${pkgdir}/usr/src/linux-${_kernver}/scripts
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/.tmp_versions

	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/kernel

	cp arch/$KARCH/Makefile ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/
	if [ "$CARCH" = "i686" ]; then
		cp arch/$KARCH/Makefile_32.cpu ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/
	fi
	cp arch/$KARCH/kernel/asm-offsets.s ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/kernel/

	# add docbook makefile
	install -D -m644 Documentation/DocBook/Makefile \
		${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile

	# add config
	for config in `find ./include/config -size +1c -type f`; do
		mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/$(dirname ${config})
		cp -a ${config} ${pkgdir}/usr/src/linux-${_kernver}/$(dirname ${config})
	done

	# add headers
	for header in `find -size +1c -name '*.h'`; do
		mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/$(dirname ${header})
		cp -a ${header} ${pkgdir}/usr/src/linux-${_kernver}/$(dirname ${header})
	done

	# copy in Kconfig files
	for i in `find . -name "Kconfig*"`; do
		mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/`echo $i | sed 's|/Kconfig.*||'`
		cp $i ${pkgdir}/usr/src/linux-${_kernver}/$i
	done

	# strip scripts directory
	find ${pkgdir}/usr/src/linux-${_kernver}/scripts  -type f -perm -u+w 2>/dev/null | while read binary ; do
		case "$(file -bi "$binary")" in
			*application/x-sharedlib*) # Libraries (.so)
				/usr/bin/strip $STRIP_SHARED "$binary"
			;;
			*application/x-archive*) # Libraries (.a)
				/usr/bin/strip $STRIP_STATIC "$binary"
			;;
			*application/x-executable*) # Binaries
				/usr/bin/strip $STRIP_BINARIES "$binary"
			;;
		esac 
	done

	chown -R root.root ${pkgdir}/usr/src/linux-${_kernver}
	find ${pkgdir}/usr/src/linux-${_kernver} -type d -exec chmod 755 {} \;
	# remove unneeded architectures
	rm -rf ${pkgdir}/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,um,v850,xtensa}
}
pkgdesc="The Linux Kernel and modules, BlackEagle Server Edition"
