# Maintainer: Dieghen89 <dieghen89@gmail.com>
# Thanks to graysky for a lot of features in this PKGBUILD

TUX_ON_ICE="y"
BROADCOM_WL="n"
LOCALMODCONFIG="n"
USE_CURRENT="n"
UKSM="y"
X86_64="n"

### HOW-TO:
#
## >> Details for: TUX_ON_ICE
#		Set it to "n" you you don't want the Tux On Ice support
#
## >> Details for: BROADCOM_WL
#		Set is to "y" if you need the iw module for your wireless card
#
## >> Details for: LOCALMODCONFIG
#		Set it to "y" if you want to modify my config file and include only
#		the modules that you are using in this moment.
#		Be sure that are all probed!
#
#		P.S. this pkgbuild supports the graysky's modprobe_db package
#
## >> Details for: USE_CURRENT
#		Use your current config file istead the one shipped by kernel-netbook
#
## >> Details for: UKSM
#		Set it to "y" to enable the testing uKSM patch, more info here:
#		http://kerneldedup.org
#
## >> Details for: X86_64
#		Set it to "y" to enable building this kernel for a x86_64 system
#		WARNING: this is not tested nor supported
#
## >> The previous BFQ_IO_SCHEDULER is useless, read the wiki page in google code
#
##########

pkgname="kernel-netbook"
true && pkgname=('kernel-netbook' 'kernel-netbook-headers')
makedepends=('dmidecode' 'xmlto' 'docbook-xsl' 'linux-firmware' 'lz4' 'bc')
optdepends=('mkinitcpio: optional initramfs creation' 'hibernate-script: tux on ice default script' 'tuxonice-userui: graphical interface for toi [AUR]')
_basekernel=3.12
pkgver=${_basekernel}
pkgrel=2
pkgdesc="Static kernel for netbooks with Intel Atom N270/N280/N450/N550/N570 such as eeepc with the add-on of external firmware (broadcom-wl) and patchset (BFS + TOI + BFQ optional) - Only Intel GPU - Give more power to your netbook!"
options=('!strip')
arch=('i686') && [ "$X86_64" = "y" ] && arch+=('x86_64')
license=('GPL2')
url=('http://code.google.com/p/kernel-netbook')

#############################################
#  External drivers, firmware and variables #
#############################################

#Broadcom-wl:
broadcom_ver=6.30.223.141
broadcom="hybrid-v35-nodebug-pcoem-${broadcom_ver//./_}"
[ "$X86_64" = "y" ] && broadcom="hybrid-v35_64-nodebug-pcoem-${broadcom_ver//./_}"
#BFS: - http://users.on.net/~ckolivas/kernel/ -
_ckpatchversion=1
_ckpatchname="patch-${_basekernel}-ck${_ckpatchversion}"
#BFQ: - http://algo.ing.unimo.it/people/paolo/disk_sched/ -
_bfqpath="http://www.algogroup.unimo.it/people/paolo/disk_sched/patches/3.12.0-v6r2"
#TuxOnIce:
_toipath="https://github.com/NigelCunningham/tuxonice-kernel/compare"
_toipatchname="mirrors:v${pkgver}...tuxonice-${_basekernel}.diff"
#uKSM:
_uksm="http://kerneldedup.org/download/uksm/0.1.2.2"
_uksm_name="uksm-0.1.2.2-for-v3.12"
#GCC patch to enable more CPU optimizations
_gcc_patch="kernel-312-gcc48-1.patch"
#Exfat:
_exfat_version="1.2.4"

#############################################
#  Sources                                  #
#############################################
noextract=("exfat_${_exfat_version}.zip")
#
source=("http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basekernel}.tar.bz2"
	"http://ftp.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.bz2"
	#BFS patch:
	"http://ck.kolivas.org/patches/3.0/3.12/3.12-ck${_ckpatchversion}/${_ckpatchname}.bz2"
	#BFQ patch:
	"${_bfqpath}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v6r2-3.12.patch"
	"${_bfqpath}/0002-block-introduce-the-BFQ-v6r2-I-O-sched-for-3.12.patch"
	"${_bfqpath}/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-v6r2-for-3.12.0.patch"
	#exFAT patch:
	"exfat_${_exfat_version}.zip"
	"exFAT-${_basekernel}-combined.patch"
	#Misc:
	"http://repo-ck.com/source/gcc_patch/${_gcc_patch}.gz"
	"logo_linux_mono.pbm"
	"logo_linux_clut224.ppm"
	"logo_linux_vga16.ppm"
	#Others:
	"linux-recent.patch"
	"license.patch"
	"change-default-console-loglevel.patch"
	"acerhdf.patch"
	"kernel-netbook.preset"
	"config")

md5sums=('b6495f56f5e7166e82c5d04d0024c02a'
         '6e692d7e290cda72aaf45bf7f397421b'
         '0c8d9758aad0e5f971e0478a89b254a3'
         '2d39966d14fdad1e05679232f97fdb3c'
         '2965641038a5aae263722b1ba16b971b'
         '9a55951ee4c3741b61e2e159631b5cf2'
         'ad9e1009ea4e6f0d252ba65445d42276'
         '8b7d99f2d357d4b6405e2c085e64a49f'
         '46d23d5c38dea9916edb15c00fee9218'
         'e8c333eaeac43f5c6a1d7b2f47af12e2'
         '5974286ba3e9716bfbad83d3f4ee985a'
         'a6f0377c814da594cffcacbc0785ec1a'
         '55dbf7072f6fa8758d29d898481b94dc'
         '160a6054ceca92db60898852983a42d4'
         '98beb36f9b8cf16e58de2483ea9985e3'
         '40da1bf34c6042d08e83e1d7c2104d25'
         'a9c018cb0b9caa90f03ee90b71a2c457'
         '5cb9dde0e5ab2fff513b3233504a9703')
#############################################
#  Managing Options                         #
#############################################
#
# tuxonice
#
if [ $TUX_ON_ICE = "y" ] ; then
	source+=("${_toipath}/${_toipatchname}")
	md5sums+=('SKIP')
fi
#
# broadcom_wl
#
if [ $BROADCOM_WL = "y" ] ; then
 	source+=("http://www.broadcom.com/docs/linux_sta/${broadcom}.tar.gz")
	if [ "$X86_64" = "y" ] ; then
		md5sums+=('039f33d2a3ff2890e42717092d1eb0c4')
	else
		md5sums+=('f4809d9149e8e60ef95021ae93a4bf21')
	fi
fi
#
# uksm
#
if [ $UKSM = "y" ] ; then
	source+=("${_uksm}/${_uksm_name}.patch")
	md5sums+=('57cbf7fa8220461f8a052ea0eb9af779')
fi

prepare() {

	#Extract the exFAT driver to a folder inside $srcdir
	cd ${srcdir}
	mkdir exFAT/ && cd exFAT/
	unzip ${srcdir}/"exfat_${_exfat_version}.zip"
 
	cd ${srcdir}/linux-$_basekernel

	# Patching Time:

	# minorversion patch:
	if [ ! ${_basekernel} = $pkgver ] ; then
		msg "Minorversion patch"
		patch -p1 -i "${srcdir}/patch-${pkgver}"
	fi

	# Update the acerhdf module to fix fan issues:
	msg "Patching acerhdf to newer version"
	patch -p1 -i "${srcdir}/acerhdf.patch"

	# set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
	# remove this when a Kconfig knob is made available by upstream
	# (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
	msg "Changing default console loglevel"
	patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"

	# replace tux logo with arch one
	install -m644 ${srcdir}/logo_linux_clut224.ppm drivers/video/logo/
	install -m644 ${srcdir}/logo_linux_mono.pbm drivers/video/logo/
	install -m644 ${srcdir}/logo_linux_vga16.ppm drivers/video/logo/

	## Patch source to enable more gcc CPU optimizations via the make nconfig
	msg "Enabling more gcc CPU optimizations"
	patch -Np1 -i "${srcdir}/${_gcc_patch}"

	# --> BFS
	msg "Patching source with BFS patch"
	#Adjust localversion
	sed -i -e "s/-ck${_ckpatchversion}//g" ${srcdir}/${_ckpatchname}
	#patching time
	patch -Np1 -i ${srcdir}/${_ckpatchname}

	# --> TOI
	if [ $TUX_ON_ICE = "y" ] ; then
		msg "Patching source with TuxOnIce patch"
		patch -Np1 -i ${srcdir}/${_toipatchname}
	fi

	# --> BFQ
	msg "Patching source with BFQ patches"
	for patch in $(ls ${srcdir}/000*BFQ*.patch) ; do
		patch -Np1 -i $patch
	done

	# --> uKSM
	if [ $UKSM = "y" ] ; then
		msg "Patching source with uKSM patch"
		patch -Np1 -i ${srcdir}/${_uksm_name}.patch
	fi

	# --> exFAT
	cd ${srcdir}/exFAT/
	msg "Patching exFAT driver"
	patch -Np1 -i ${srcdir}/exFAT-${_basekernel}-combined.patch
	cd ${srcdir}/linux-${_basekernel}

	### Clean tree and copy config file over
	msg "Running make mrproper to clean source tree"
	make mrproper

	# copy config
	cp ../config ./.config

	# Coded by nous
	if [ $USE_CURRENT = "y" ]; then
		if [[ -s /proc/config.gz ]]; then
			msg "Extracting config from /proc/config.gz..."
			# modprobe configs
			zcat /proc/config.gz > ./.config
		else
			warning "You kernel was not compiled with IKCONFIG_PROC!"
			warning "You cannot read the current config!"
			warning "Aborting!"
			exit
		fi
	fi

	# don't run depmod on 'make install'. We'll do this ourselves in packaging
	sed -i '2iexit 0' scripts/depmod.sh
}

build() {

	cd ${srcdir}/linux-$_basekernel

	make prepare

	if [ $LOCALMODCONFIG = "y" ] ; then
		msg "If you have modprobe_db installed, running it in recall mode now"
		if [ -e /usr/bin/modprobed_db ] ; then
			[[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo.  Install via pacman -S sudo and configure to work with this user." && exit 1
			sudo /usr/bin/modprobed_db recall
		fi
		msg "Running Steven Rostedt's make localmodconfig now"
		make localmodconfig
	fi

	# make defconfig
	# configure kernel
	# use menuconfig, if you want to change the configuration
	make menuconfig
	# make gconfig
	# make nconfig
	yes "" | make config

	# Save configuration for later reuse
	cat .config > ${startdir}/config.last

	# build kernel
	msg "Now starts something magic:"
	make ${MAKEFLAGS} bzImage modules
}

package_kernel-netbook() {
	pkgdesc='Static kernel for netbooks with Intel Atom N270/N280/N450/N550 such as eeepc with the add-on of external firmware (broadcom-wl) - Only Intel GPU - Give more power to your netbook!'
	depends=('coreutils' 'kmod')
	install=kernel-netbook.install
	optdepends=('crda: for wireless regulatory domain support' 
			'linux-firmware: firmware for rt2860, tigon3, brcmsmac'
			'hibernate-script: tux on ice default script'
			'tuxonice-userui: graphical interface for toi [AUR]')
	groups=(eee)
	provides=('linux')

	cd ${srcdir}/linux-$_basekernel
	# install our modules
	mkdir -p $pkgdir/{lib/modules,boot}
	make INSTALL_MOD_PATH=$pkgdir modules_install

	# Get kernel version
	_kernver="$(make kernelrelease)"

	# remove build and source links
	rm -r $pkgdir/lib/modules/$_kernver/{source,build}

	# remove the firmware directory
	rm -rf ${pkgdir}/lib/firmware

	# install the kernel
	install -D -m644 ${srcdir}/linux-$_basekernel/System.map $pkgdir/boot/System.map-netbook
	install -D -m644 ${srcdir}/linux-$_basekernel/arch/x86/boot/bzImage ${pkgdir}/boot/vmlinuz-netbook
	install -D -m644 ${srcdir}/linux-$_basekernel/.config $pkgdir/boot/kconfig-netbook

	# set correct depmod command for install
	cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
	true && install=${install}.pkg
	sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/${install}

	# install mkinitcpio preset file for kernel
	install -D -m644 "${srcdir}/${pkgname}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"

	##Extramodules dir support
	_extramodules="extramodules-${_basekernel}${_kernelname:--netbook}"

	##Section: Broadcom-wl
	if [ "${BROADCOM_WL}" == "y" ] ; then
		msg "Compiling broadcom-wl module:"
		cd ${srcdir}/
		cp -ar src/wl src/wl_orig
		patch -p1 -N -i linux-recent.patch
		patch -p1 -N -i license.patch
		make -C ${srcdir}/linux-$_basekernel M=`pwd`
		install -D -m 755 wl.ko ${pkgdir}/lib/modules/${_extramodules}/wl.ko
		rm -r src/wl
		mv src/wl_orig src/wl
	fi

	##Section: exFAT
	msg "Compiling exFAT module:"
	cd ${srcdir}/exFAT/
	make -C ${srcdir}/linux-${_basekernel}/ M=`pwd` modules
	install -D -m 755 exfat_core.ko ${pkgdir}/lib/modules/${_extramodules}/exfat_core.ko
	install -D -m 755 exfat_fs.ko ${pkgdir}/lib/modules/${_extramoduled}/exfat_fs.ko

	# gzip -9 all modules to safe a lot of MB of space
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;

	# make room for external modules
	ln -s "../${_extramodules}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
	# add real version for building modules and running depmod from post_install/upgrade
	mkdir -p "${pkgdir}/lib/modules/${_extramodules}"
	echo "${_kernver}" > "${pkgdir}/lib/modules/${_extramodules}/version"

	cd ${srcdir}/linux-${_basekernel}
	# move module tree /lib -> /usr/lib
	mkdir $pkgdir/usr
	mv "$pkgdir/lib" "$pkgdir/usr/"

	# Now we call depmod...
	depmod -b "$pkgdir/usr" -F System.map "$_kernver"
}

package_kernel-netbook-headers() {
	KARCH=x86
	pkgdesc='Header files and scripts for building modules for kernel-netbook'
	provides=('linux-headers')

	install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

	cd "${pkgdir}/usr/lib/modules/${_kernver}"
	ln -sf ../../../src/linux-${_kernver} build

	cd "${srcdir}/linux-${_basekernel}"
	install -D -m644 Makefile \
		"${pkgdir}/usr/src/linux-${_kernver}/Makefile"
	install -D -m644 kernel/Makefile \
		"${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile"
	install -D -m644 .config \
		"${pkgdir}/usr/src/linux-${_kernver}/.config"

	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include"

	for i in acpi asm-generic config crypto drm generated linux math-emu \
		media net pcmcia scsi sound trace uapi video xen; do
		cp -a include/${i} "${pkgdir}/usr/src/linux-${_kernver}/include/"
	done

	# copy arch includes for external modules
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/arch/x86"
	cp -a arch/x86/include "${pkgdir}/usr/src/linux-${_kernver}/arch/x86/"

	# copy files necessary for later builds, like nvidia and vmware
	cp Module.symvers "${pkgdir}/usr/src/linux-${_kernver}"
	cp -a scripts "${pkgdir}/usr/src/linux-${_kernver}"

	# fix permissions on scripts dir
	chmod og-w -R "${pkgdir}/usr/src/linux-${_kernver}/scripts"
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/.tmp_versions"

	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/kernel"

	cp arch/${KARCH}/Makefile "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/"

	if [ "${CARCH}" = "i686" ]; then
		cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/"
	fi

	cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/kernel/"

	# add headers for lirc package
	for i in bt8xx cx88 saa7134; do
		mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/pci/${i}"
		cp -a drivers/media/pci/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/pci/${i}"
	done
	# usb
	for i in cpia2 em28xx pwc sn9c102; do
		mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/usb/${i}"
		cp -a drivers/media/usb/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/usb/${i}"
	done
	# i2c
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c"
	cp drivers/media/i2c/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/"
	for i in cx25840; do
		mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/${i}"
		cp -a drivers/media/i2c/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/${i}"
	done

	# add docbook makefile
	install -D -m644 Documentation/DocBook/Makefile \
		"${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile"

	# add dm headers
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/md"
	cp drivers/md/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/md"

	# add inotify.h
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include/linux"
	cp include/linux/inotify.h "${pkgdir}/usr/src/linux-${_kernver}/include/linux/"

	# add wireless headers
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/"
	cp net/mac80211/*.h "${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/"

	# add dvb headers for external modules
	# in reference to:
	# http://bugs.archlinux.org/task/9912
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-core"
	cp drivers/media/dvb-core/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-core/"
	# and...
	# http://bugs.archlinux.org/task/11194
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/"

	[[ -d include/config/dvb ]] && find include/config/dvb -name '*.h' -exec cp {} \
		"${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/" \;

	# add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
	# in reference to:
	# http://bugs.archlinux.org/task/13146
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-frontends/"
	cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-frontends/"
	cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/"

	# add dvb headers
	# in reference to:
	# http://bugs.archlinux.org/task/20402
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/usb/dvb-usb"
	cp drivers/media/usb/dvb-usb/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/usb/dvb-usb/"
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-frontends"
	cp drivers/media/dvb-frontends/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-frontends/"
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/tuners"
	cp drivers/media/tuners/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/tuners/"

	# add xfs and shmem for aufs building
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/fs/xfs"
	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/mm"
	cp fs/xfs/xfs_sb.h "${pkgdir}/usr/src/linux-${_kernver}/fs/xfs/xfs_sb.h"

	# copy in Kconfig files
	for i in `find . -name "Kconfig*"`; do
		mkdir -p "${pkgdir}"/usr/src/linux-${_kernver}/`echo ${i} | sed 's|/Kconfig.*||'`
		cp ${i} "${pkgdir}/usr/src/linux-${_kernver}/${i}"
	done

	chown -R root.root "${pkgdir}/usr/src/linux-${_kernver}"
	find "${pkgdir}/usr/src/linux-${_kernver}" -type d -exec chmod 755 {} \;

	# strip scripts directory
	find "${pkgdir}/usr/src/linux-${_kernver}/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
		case "$(file -bi "${binary}")" in
			*application/x-sharedlib*) # Libraries (.so)
				/usr/bin/strip ${STRIP_SHARED} "${binary}";;
			*application/x-archive*) # Libraries (.a)
				/usr/bin/strip ${STRIP_STATIC} "${binary}";;
			*application/x-executable*) # Binaries
				/usr/bin/strip ${STRIP_BINARIES} "${binary}";;
		esac
	done

	# remove unneeded architectures
	rm -rf "${pkgdir}"/usr/src/linux-${_kernver}/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa}
}

##
pkgdesc="Static kernel for netbooks with Intel Atom N270/N280/N450/N550 such as eeepc with the add-on of external firmware (broadcom-wl) - Only Intel GPU - Give more power to your netbook!"
