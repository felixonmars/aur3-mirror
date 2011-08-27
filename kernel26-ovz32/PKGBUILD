# Maintainer: Pavel Larev <pavel@larev.ws>
# Fixed to compile with GCC 4.6 and make-3.82 by alf500 <hammerm98 [at] googlemail [dot] com>

pkgname="kernel26-ovz32"
pkgver="2.6.32_feoktistov.1"
pkgrel=2
pkgdesc="OpenVZ enabled kernel and modules."
_basekernel="2.6.32"
_ovzker="ovz32"
_ovzver="feoktistov.1"
arch=('i686' 'x86_64')
url="http://www.openvz.org"
license=('GPL2')
depends=('coreutils' 'module-init-tools' 'mkinitcpio>=0.5.15')
makedepends=('bzip2' 'gcc')
options=(!strip)
install=kernel26-ovz32.install

source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-${_basekernel}.tar.bz2
	http://download.openvz.org/kernel/branches/${_basekernel}/${_basekernel}-${_ovzver}/patches/patch-${_ovzver}-combined.gz
	http://download.openvz.org/kernel/branches/${_basekernel}/${_basekernel}-${_ovzver}/configs/kernel-${_basekernel}-i686.config.ovz
	http://download.openvz.org/kernel/branches/${_basekernel}/${_basekernel}-${_ovzver}/configs/kernel-${_basekernel}-i686-PAE.config.ovz
	http://download.openvz.org/kernel/branches/${_basekernel}/${_basekernel}-${_ovzver}/configs/kernel-${_basekernel}-x86_64.config.ovz
	kernel26-${_ovzker}.preset
	silence-gcc-4.6.0-warnings-2.6.32.patch
	buildfix-gcc-4.6.patch
	buildfix-make-3.82.patch
	${pkgname}.install)

md5sums=('260551284ac224c3a43c4adac7df4879'
         '3dce854bba4a2e4a41cc7b46699b7c20'
         'f2069a47bceff212f1171f2ceb204bbb'
         'e71272ddb4926ca5b2c3022a66a2a80e'
         'ab79b81f10a3216d5e5a41c12e3f19b9'
         '900b2a994f4677495fcd97f69e9a58ad'
         '87030e3a1fe65180f5a3e7c789a35349'
         '19dfa0d27ec61e67045848ae3a0dddd3'
         'e0fb6966ed2c5283cb4d68051d26e322'
         '88db9143aea70a3a392defd61081fa43')

MAKEFLAGS="-j5"

build() {

	KARCH=x86

	cd ${srcdir}/linux-${_basekernel}

	# Apply OpenVZ Patch 
	patch -Np1 -i ../patch-${_ovzver}-combined || return 1
        patch -Np1 -i ../silence-gcc-4.6.0-warnings-2.6.32.patch || return 1
	patch -Np1 -i ../buildfix-gcc-4.6.patch || return 1
	patch -Np1 -i ../buildfix-make-3.82.patch
	sed -i Documentation/video4linux/v4lgrab.c -e "s:#include <linux/videodev.h>:#include <libv4l1-videodev.h>:"

	if [ "$CARCH" = "x86_64" ]; then
		cat ../kernel-${_basekernel}-x86_64.config.ovz >./.config
	else
		# Uncomment i686-PAE kernel & comment out std i686 kernel if you have a system with more than 4GB
		#cat ../kernel-${_basekernel}-i686-PAE.config.ovz >./.config
		cat ../kernel-${_basekernel}-i686.config.ovz >./.config
	fi
	if [ "${_ovzver}" != "" ]; then
		sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"-OVZ32-${_ovzver}\"|g" ./.config
	fi
	
	# Get Kernel Version
	make prepare	
	_kernver="$(make kernelrelease)"

	# Load .config & start compile
	make oldconfig

	# If you would like to configure the kernel yourself select one of the options below and comment ^make oldconfig^
	#make menuconfig
	#make xconfig
	#make config
	
	# Build The Kernel!
	make ${MAKEFLAGS} bzImage modules || return 1
	mkdir -p ${pkgdir}/{lib/modules,boot}
	make INSTALL_MOD_PATH=${pkgdir} modules_install || return 1
	cp System.map ${pkgdir}/boot/System.map26-${_ovzker}
	cp arch/$KARCH/boot/bzImage ${pkgdir}/boot/vmlinuz26-${_ovzker}
	install -D -m644 Makefile \
		${pkgdir}/usr/src/linux-${_kernver}/Makefile
	install -D -m644 kernel/Makefile \
		${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
	install -D -m644 .config \
		${pkgdir}/usr/src/linux-${_kernver}/.config
	install -D -m644 .config ${pkgdir}/boot/kconfig26-${_ovzker}
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include

	for i in acpi asm-{generic,x86} config linux math-emu media net pcmcia scsi sound video bc; do
		cp -a include/$i ${pkgdir}/usr/src/linux-${_kernver}/include/
	done

	# Copy arch includes for external modules
	#mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/x86
	#cp -a arch/x86/include ${pkgdir}/usr/src/linux-${_kernver}/arch/x86/

	# Copy files necessary for later builds, like nvidia and vmware
	cp Module.symvers ${pkgdir}/usr/src/linux-${_kernver}
	cp -a scripts ${pkgdir}/usr/src/linux-${_kernver}

	# Fix permissions on scripts dir
	chmod og-w -R ${pkgdir}/usr/src/linux-${_kernver}/scripts

	# Setup /src/ directory
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/kernel
	cp arch/$KARCH/Makefile ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/

	if [ "$CARCH" = "i686" ]; then
		cp arch/$KARCH/Makefile_32.cpu ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/
	fi
	
	cp arch/$KARCH/kernel/asm-offsets.s ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/kernel/

	# Add headers for lirc package
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video
	cp drivers/media/video/*.h  ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/
	
	for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102 usbvideo zc0301; do
		mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/$i
		cp -a drivers/media/video/$i/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/$i
	done

	# Add dm headers
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/md
	cp drivers/md/*.h  ${pkgdir}/usr/src/linux-${_kernver}/drivers/md
	
	# Add inotify.h
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/linux
	cp include/linux/inotify.h ${pkgdir}/usr/src/linux-${_kernver}/include/linux/
	
	# Add CLUSTERIP file for iptables
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/net/ipv4/netfilter/

	# Add wireless headers
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/
	cp net/mac80211/*.h ${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/

	# Add xfs and shmem for aufs building
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/fs/xfs
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/mm
	cp fs/xfs/xfs_sb.h ${pkgdir}/usr/src/linux-${_kernver}/fs/xfs/xfs_sb.h
	
	#drm
	cp -a include/drm $pkgdir/usr/src/linux-${_kernver}/include/

	# Add vmlinux
	cp vmlinux ${pkgdir}/usr/src/linux-${_kernver}

	# Copy Kconfig files
	for i in `find . -name "Kconfig*"`; do
		mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/`echo $i | sed 's|/Kconfig.*||'`
		cp $i ${pkgdir}/usr/src/linux-${_kernver}/$i
	done

	cd ${pkgdir}/usr/src/linux-${_kernver}/include && ln -s asm-$KARCH asm

	chown -R root.root ${pkgdir}/usr/src/linux-${_kernver}
	find ${pkgdir}/usr/src/linux-${_kernver} -type d -exec chmod 755 {} \;
	cd ${pkgdir}/lib/modules/${_kernver} && \
		(rm -f source build; ln -sf ../../../usr/src/linux-${_kernver} build)

	# Install fallback mkinitcpio.conf file and preset file for kernel
	install -m644 -D ${srcdir}/${pkgname}.preset ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset || return 1

	# Set correct depmod command for install
	sed \
	-e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernver}/g" \
	-e  "s/PKGNAME=.*/PKGNAME=${pkgname}/g" \
	-i $startdir/kernel26-${_ovzker}.install
	sed \
	-e "s|source .*|source /etc/mkinitcpio.d/${pkgname}.kver|g" \
	-e "s|default_image=.*|default_image=\"/boot/${pkgname}.img\"|g" \
	-e "s|fallback_image=.*|fallback_image=\"/boot/${pkgname}-fallback.img\"|g" \
	-i ${pkgdir}/etc/mkinitcpio.d/kernel26-${_ovzker}.preset

	echo -e "# DO NOT EDIT THIS LINE\nALL_kver='${_kernver}'" > ${startdir}/pkg/etc/mkinitcpio.d/${pkgname}.kver
	
	# Remove unneeded architectures
	rm -rf ${pkgdir}/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa}
}
