# Maintainer : Claire Farron <https://github.com/clfarron4/linux-lts-ck-archlinux>
# Major Contributor: graysky <graysky AT archlinux DOT us> (Maintainer of linux-ck)
# Submitter  : V3n3RiX <venerix@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### PATCH AND BUILD OPTIONS
# Set these variables to ANYTHING that is not null (y or hello or 2 or "I like icecream") to enable them
#
_pstates_pat=   # Enable Haswell support for the new Intel pstate drive
_makenconfig=   # Tweak kernel options prior to a build via nconfig
_localmodcfg=   # Compile ONLY probed modules
_use_current=   # Use the current kernel's .config file
_BFQ_enable_=y  # Enable BFQ as the default I/O scheduler
_NUMAdisable=y  # Disable NUMA in kernel config

### DOCS
# Starting with the 3.6.9-3 release, this package ships with the kernel-3x-gcc47-x.patch.
# This allows users an expanded scope of CPU specific options.
# Consult the following resources to understand which option is right for you application:
#
# http://en.gentoo-wiki.com/wiki/Safe_Cflags/Intel
# http://en.gentoo-wiki.com/wiki/Safe_Cflags/AMD
# http://www.linuxforge.net/docs/linux/linux-gcc.php
# http://gcc.gnu.org/onlinedocs/gcc/i386-and-x86_002d64-Options.html

# DETAILS FOR _pstates_pat
# Enable pstate driver for Haswell CPUs. Patch for Sandy/Ivy is included in 3.10 upstream.
# Not sure when the Haswell support is planned but several Arch users have been using this code
# without problems for several weeks.
# See https://plus.google.com/117091380454742934025/posts/2vEekAsG2QT for a discussion.
#
# DETAILS FOR _localmodcfg=
# As of mainline 2.6.32, running with this option will only build the modules that you currently have
# probed in your system VASTLY reducing the number of modules built and the build time to do it.
#
# WARNING - make CERTAIN that all modules are modprobed BEFORE you begin making the pkg!
#
# To keep track of which modules are needed for your specific system/hardware, give my module_db script
# a try: http://aur.archlinux.org/packages.php?ID=41689  Note that if you use my script, this PKGBUILD
# will auto run the 'sudo modprobed_db reload' for you to probe all the modules you have logged!
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed_db

# DETAILS FOR _use_current=
# Enabling this option will use the .config of the RUNNING kernel rather than the ARCH defaults.
# Useful when the package gets updated and you already went through the trouble of customizing your
# config options.  NOT recommended when a new kernel is released, but again, convenient for package bumps.

# DETAILS FOR _BFQ_enable=
# Alternative I/O scheduler by Paolo.  For more, see: http://algo.ing.unimo.it/people/paolo/disk_sched/

# DETAILS FOR _NUMAdisable=
# Since >99 % of users do not have multiple CPUs but do have multiple cores in one CPU.
# see, https://bugs.archlinux.org/task/31187

pkgname=linux-lts-ck
true && pkgname=(linux-lts-ck linux-lts-ck-headers)
_kernelname=-lts-ck
_srcname=linux-3.10
pkgver=3.10.35
pkgrel=1
arch=('i686' 'x86_64')
url="https://wiki.archlinux.org/index.php/Linux-ck"
license=('GPL2')
makedepends=('kmod' 'inetutils' 'bc')
options=('!strip')
_ckpatchversion=1
_ckpatchname="patch-3.10-ck${_ckpatchversion}"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc.patch"
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.10.8+-v7r2"
source=("http://www.kernel.org/pub/linux/kernel/v3.x/${_srcname}.tar.xz"
		"http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
		"http://ck.kolivas.org/patches/3.0/3.10/3.10-ck${_ckpatchversion}/${_ckpatchname}.bz2"
		"http://repo-ck.com/source/gcc_patch/${_gcc_patch}.gz"
		'enable_haswell_pstate_driver.patch'
		'linux-lts-ck.preset'
		'change-default-console-loglevel.patch'
		'config' 'config.x86_64'
		'criu-no-expert.patch'
		"${_bfqpath}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v7r2-3.10.8+.patch"
		"${_bfqpath}/0002-block-introduce-the-BFQ-v7r2-I-O-sched-for-3.10.8+.patch"
		"${_bfqpath}/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-v7r2-for-3.10.8+.patch")
sha256sums=('df27fa92d27a9c410bfe6c4a89f141638500d7eadcca5cce578954efc2ad3544'
            '6e8a5f7adfabd31b9184f6dd9bb78195de8a8522bc7f7e171e1eff79953aa1bd'
            '747d893b69d040dd82650a1a2d509155beace337020619194661049920650ed6'
            '70717f6c64bed9da2450b3a824b25df0a916cdf43ee1e0f537057db3f9a33b8d'
            'd7fada52453d12a24af9634024c36792697f97ce0bc6552939cd7b2344d00cd9'
            '205fe05977dffb72f584ad23b2db8d31c6d8361e1cb9a69a9c4aa546727b0145'
            '56bd99e54429a25a144f2d221718b67f516344ffd518fd7dcdd752206ec5be69'
            '59be2c933282cb719de8e958996ef51314f2fad5f024930cf2e7d6068f71aa14'
            '17eda278e65924f0c97bd81d90f7672252ac8926b06a0d10ac2d0a7543e68769'
            'daa75228a4c45a925cc5dbfeba884aa696a973a26af7695adc198c396474cbd5'
            'eb1703be3eeef6d93befd355b2c366ac9d02fe46d1483d012c22a6022b984de1'
            'ee99c56324f72507c96e14eb3beb495ada6a0f29735801bf1e98f4aac3fff74b'
            'afa12b38a9304810cb5c9bfc3b3aab88a633048d20c60ffc08973e47c650d203')

prepare() {
	cd "${_srcname}"

	# add upstream patch
	msg "Patching source to v$pkgver"
	patch -p1 -i "${srcdir}/patch-${pkgver}"

	# set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
	# remove this when a Kconfig knob is made available by upstream
	# (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
	patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"

	# allow criu without expert option set
	# patch from fedora
	patch -Np1 -i "${srcdir}/criu-no-expert.patch"

	### Patch source with ck patchset with BFS
	# Fix double name in EXTRAVERSION
	sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "${srcdir}/${_ckpatchname}"
	msg "Patching source with ck1 including BFS v0.440"
	patch -Np1 -i "${srcdir}/${_ckpatchname}"

	if [ -n "$_pstates_pat" ]; then
		### Patch source to enable pstate drivers with ivybridge CPUs
		### see https://plus.google.com/117091380454742934025/posts/2vEekAsG2QT
		msg "Patching source to enable Intel Pstate driver for Haswell CPUs"
		patch -Np1 -i "${srcdir}/enable_haswell_pstate_driver.patch"
	fi
	
	### Patch source to enable more gcc CPU optimizatons via the make nconfig
	msg "Patching source to enable more gcc CPU optimizatons"
	patch -Np1 -i "${srcdir}/${_gcc_patch}"

	msg "Patching source with BFQ patches"
	for p in $(ls ${srcdir}/000{1,2,3}-block*.patch); do
		msg " $p"
		patch -Np1 -i "$p"
	done

	### Clean tree and copy ARCH config over
	msg "Running make mrproper to clean source tree"
	make mrproper

	if [ "${CARCH}" = "x86_64" ]; then
		cat "${srcdir}/config.x86_64" > ./.config
	else
		cat "${srcdir}/config" > ./.config
	fi

	### Optionally use running kernel's config
	# code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
	if [ -n "$_use_current" ]; then
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

	if [ "${_kernelname}" != "" ]; then
		sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
		sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
	fi
	
	### BFQ to be compiled in but not enabled
	sed -i -e s'/CONFIG_CFQ_GROUP_IOSCHED=y/CONFIG_CFQ_GROUP_IOSCHED=y\nCONFIG_IOSCHED_BFQ=y\nCONFIG_CGROUP_BFQIO=y/' \
		-i -e s'/CONFIG_DEFAULT_CFQ=y/CONFIG_DEFAULT_CFQ=y\n# CONFIG_DEFAULT_BFQ is not set/' ./.config

	### Optionally enable BFQ as the default io scheduler
	if [ -n "$_BFQ_enable_" ]; then
		sed -i -e '/CONFIG_DEFAULT_IOSCHED/ s,cfq,bfq,' \
		-i -e s'/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set\nCONFIG_DEFAULT_BFQ=y/' ./.config
	fi

	# disable NUMA since 99.9% of users do not have multiple CPUs but do have multiple cores in one CPU
	# see, https://bugs.archlinux.org/task/31187
	if [ -n "$_NUMAdisable" ]; then
		if [ "${CARCH}" = "x86_64" ]; then
			sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
				-i -e '/CONFIG_AMD_NUMA=y/d' \
				-i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
				-i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
				-i -e '/# CONFIG_NUMA_EMU is not set/d' \
				-i -e '/CONFIG_NODES_SHIFT=6/d' \
				-i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
				-i -e '/# CONFIG_MOVABLE_NODE is not set/d' \
				-i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
				-i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
		fi
	fi

	# set extraversion to pkgrel
	sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

	# don't run depmod on 'make install'. We'll do this ourselves in packaging
	sed -i '2iexit 0' scripts/depmod.sh
}

build() {
	cd "${_srcname}"

	# get kernel version
	msg "Running make prepare for you to enable patched options of your choosing"
	make prepare

	### Optionally load needed modules for the make localmodconfig
	# See http://aur.archlinux.org/packages.php?ID=41689
	if [ -n "$_localmodcfg" ]; then
		msg "If you have modprobe_db installed, running it in recall mode now"
		if [ -e /usr/bin/modprobed_db ]; then
			[[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo.  Install via pacman -S sudo and configure to work with this user." && exit 1
			sudo /usr/bin/modprobed_db recall
		fi
		msg "Running Steven Rostedt's make localmodconfig now"
		make localmodconfig
	fi

	if [ -n "$_makenconfig" ]; then
		msg "Running make nconfig"
		make nconfig
	fi

  # save configuration for later reuse
  if [ "${CARCH}" = "x86_64" ]; then
    cat .config > "${startdir}/config.x86_64.last"
  else
    cat .config > "${startdir}/config.last"
  fi

	msg "Running make bzImage and modules"
	make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-lts-ck() {
	_Kpkgdesc='Linux LTS Kernel and modules with the ck1 patchset featuring the Brain Fuck Scheduler v0.440.'
	pkgdesc="${_Kpkgdesc}"
	depends=('coreutils' 'linux-firmware' 'mkinitcpio>=0.7')
	optdepends=('crda: to set the correct wireless channels of your country' 'lirc-ck: Linux Infrared Remote Control kernel modules for linux-lts-ck' 'nvidia-lts-ck: nVidia drivers for linux-lts-ck' 'modprobed_db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
	provides=("linux-lts-ck=${pkgver}")
	replaces=('kernel26-lts-ck')
	backup=("etc/mkinitcpio.d/linux-lts-ck.preset")
	install=linux-lts-ck.install

	cd "${_srcname}"

	KARCH=x86

	# get kernel version
	_kernver="$(make LOCALVERSION= kernelrelease)"
	_basekernel=${_kernver%%-*}
	_basekernel=${_basekernel%.*}

	mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
	make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
	cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-lts-ck"

	# add vmlinux
	install -D -m644 vmlinux "${pkgdir}/usr/src/linux-${_kernver}/vmlinux"

	# set correct depmod command for install
	cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
	true && install=${install}.pkg

	sed \
		-e  "s/KERNEL_NAME=.*/KERNEL_NAME=-lts-ck/g" \
		-e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
		-i "${startdir}/${install}"

	# install mkinitcpio preset file for kernel
	install -D -m644 "${srcdir}/linux-lts-ck.preset" "${pkgdir}/etc/mkinitcpio.d/linux-lts-ck.preset"
	sed \
		-e "1s|'linux.*'|'linux-lts-ck'|" \
		-e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-linux-lts-ck\"|" \
		-e "s|default_image=.*|default_image=\"/boot/initramfs-linux-lts-ck.img\"|" \
		-e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-linux-lts-ck-fallback.img\"|" \
		-i "${pkgdir}/etc/mkinitcpio.d/linux-lts-ck.preset"

	# remove build and source links
	rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
	# remove the firmware
	rm -rf "${pkgdir}/lib/firmware"
	# gzip -9 all modules to save 100MB of space
	find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
	# make room for external modules
	ln -s "../extramodules-${_basekernel}${_kernelname:ck}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
	# add real version for building modules and running depmod from post_install/upgrade
	mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:ck}"
	echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:ck}/version"

	# Now we call depmod...
	depmod -b "$pkgdir" -F System.map "$_kernver"

	# move module tree /lib -> /usr/lib
	mv "$pkgdir/lib" "$pkgdir/usr"
}

package_linux-lts-ck-headers() {
	_Hpkgdesc='Header files and scripts to build modules for linux-lts-ck.'
	pkgdesc="${_Hpkgdesc}"
	depends=('linux-lts-ck') # added to keep kernel and headers packages matched
	provides=("linux-lts-ck-headers=${pkgver}" "linux-headers=${pkgver}")
	replaces=('kernel26-ck-lts-headers')

	install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

	cd "${pkgdir}/usr/lib/modules/${_kernver}"
	ln -sf ../../../src/linux-${_kernver} build

	cd "${srcdir}/${_srcname}"
	install -D -m644 Makefile \
		"${pkgdir}/usr/src/linux-${_kernver}/Makefile"
	install -D -m644 kernel/Makefile \
		"${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile"
	install -D -m644 .config \
		"${pkgdir}/usr/src/linux-${_kernver}/.config"

	mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include"

	for i in acpi asm-generic config crypto drm generated keys linux math-emu \
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
	# pci
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
	cp drivers/media/i2c/*.h  "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/"
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
	[[ -n $(ls include/config/dvb/*.h &>/dev/null) ]] && cp include/config/dvb/*.h "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/"

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
	rm -rf "${pkgdir}"/usr/src/linux-${_kernver}/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}

# Global pkgdesc and depends are here so that they will be picked up by AUR
pkgdesc='Linux Kernel and modules with the ck1 patchset featuring the Brain Fuck Scheduler v0.440.'
