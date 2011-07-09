# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: MP2E <metroidcrazy AT gmail DOT com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
###########################################################################################################
#                                          Patch and Build Options
###########################################################################################################
#
## Note all kernels get the ck patch set with BFS so there is no option to enable/disable it!
#
_usearchlogo="y"	# use the blue Arch logo rather than default tux logo when booting
_makenconfig="n"	# select additional kernel options prior to a build via nconfig
_localmodcfg="n"	# compile ONLY probed modules - see notes below!
_localyescfg="n"	# convert all modules to core - see notes below!
_use_current="n"	# use the current kernel's .config file - see notes below!
_BFQ_patches="n"	# add BFQ patches for the BFQ I/O scheduler
###########################################################################################################
#                                        More Details and References
###########################################################################################################
## LOCALMODCONFIG OPTION
# As of mainline 2.6.32, running with this option will only build the modules that you currently have
# probed in your system VASTLY reducing the number of modules build.
#
# WARNING - make CERTAIN that all modules are modprobed BEFORE you begin making the pkg!
# Read, https://bbs.archlinux.org/viewtopic.php?pid=830221#p830221
# To keep track of which modules are needed for your specific system/hardware, give my module_db script
# a try: http://aur.archlinux.org/packages.php?ID=41689
#
# Note that if you use my script, this PKGBUILD will auto run the reload_data base for you to probe
# all the modules you have logged!
#
## LOCALMODCONFIG OPTION
# This adds the option localyesconfig to make. This is similar to localmodconfig, but after it removes
# unnecessary modules it runs "sed -i s/=m/=y/" on the .config file. It then runs "make silentoldconfig"
# to fix any holes that were created by the conversion of modules to core.
## USE CURRENT KERNEL'S .CONFIG
# Enabling this option will use the .config of the RUNNING kernel rather than the ARCH defaults.
# Useful when the package gets updated and you already went through the trouble of customizing your
# config options.  NOT recommended when a new kernel is released, but again, convenient for package bumps.
## BFQ
# read, http://algo.ing.unimo.it/people/paolo/disk_sched/
#
###########################################################################################################

pkgname=kernel26-ideapad
true && pkgname=(kernel26-ideapad kernel26-ideapad-headers)
_basekernel=2.6.39
pkgver=${_basekernel}.3
pkgrel=1
epoch=1
arch=('i686' 'x86_64')
license=('GPL2')
url="http://ck-hack.blogspot.com"
_archpatchversion=1
_ckpatchversion=2
_kernelname=-ideapad
_patchname="patch-${pkgver}-${_archpatchversion}-ARCH"
_ckpatchname="patch-${_basekernel}-ck${_ckpatchversion}"
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/2.6.39"
options=(!strip)
source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-$_basekernel.tar.bz2 # kernel source
ftp://ftp.archlinux.org/other/kernel26/${_patchname}.bz2 # arch patchset
config config.x86_64 kernel26.preset # configs
http://www.kernel.org/pub/linux/kernel/people/ck/patches/2.6/${_basekernel}/${_basekernel}-ck${_ckpatchversion}/${_ckpatchname}.bz2
${_bfqpath}/0001-block-prepare-I-O-context-code-for-BFQ-v2-for-2.6.39.patch
${_bfqpath}/0002-block-cgroups-kconfig-build-bits-for-BFQ-v2-2.6.39.patch
${_bfqpath}/0003-block-introduce-the-BFQ-v2-I-O-sched-for-2.6.39.patch
fix_ck2.patch # thanks for hador for this fix
logo_linux_mono.pbm # optional Arch logo for boot
logo_linux_{clut224,vga16}.ppm) # optional Arch logo for boot

build() {
	### Hador's fix for 2.6.39.3/init/calibrate.c
	patch -N -i ${srcdir}/fix_ck2.patch

	### Patch source with -ARCH patches
	# See http://projects.archlinux.org/linux-2.6-ARCH.git/
	msg "Patching source with-ARCH patches"
	cd ${srcdir}/linux-$_basekernel
	patch -Np1 -i ${srcdir}/${_patchname}
	### Optionally replace the tux logo with the blue Arch logo
	if [ $_usearchlogo = "y" ]; then
		install -m644 ${srcdir}/logo_linux_clut224.ppm drivers/video/logo/
		install -m644 ${srcdir}/logo_linux_mono.pbm drivers/video/logo/
		install -m644 ${srcdir}/logo_linux_vga16.ppm drivers/video/logo/
	fi

	### Patch source with ck patchset with BFS
	# Fix double name in EXTRAVERSION
	sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" ${srcdir}/${_ckpatchname}
	msg "Patching source with the ck2 patch set using bfs v0.406"
	patch -Np1 -i ${srcdir}/${_ckpatchname}

	### Optionally patch source for BFQ patches
	if [ ${_BFQ_patches} = "y" ]; then
		msg "Patching source with BFQ patches"
		for p in $(ls ${srcdir}/000*.patch); do
			patch -Np1 -i $p
		done
	fi

	### Clean tree and copy ARCH config over
	msg "Running make mrproper to clean source tree"
	make mrproper

	if [ "$CARCH" = "x86_64" ]; then
		cat ../config.x86_64 >./.config
	else
		cat ../config >./.config
	fi

	### Optionally use running kernel's config
	# code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
	if [ ${_use_current} = "y" ]; then
		if [[ -s /proc/config.gz ]]; then
			msg "Extracting config from /proc/config.gz..."
			modprobe configs
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
	fi

	# If user patched to BFQ, set it as default io scheduler
	if [ ${_BFQ_patches} = "y" ]; then
		sed -i -e s'/CONFIG_CFQ_GROUP_IOSCHED=y/CONFIG_CFQ_GROUP_IOSCHED=y\nCONFIG_IOSCHED_BFQ=y\nCONFIG_CGROUP_BFQIO=y/' \
			-i -e s'/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set\nCONFIG_DEFAULT_BFQ=y/' \
			-i -e '/CONFIG_DEFAULT_IOSCHED/ s,cfq,bfq,' ./.config
	fi

	msg "Running make prepare for you to enable patched options of your choosing"
	make prepare

	### Optionally load needed modules for the make localmodconfig
	# See http://aur.archlinux.org/packages.php?ID=41689
	if [ $_localmodcfg = "y" ]; then
		msg "If you have modprobe_db installed, running reload_database now"
		if [ -e /usr/bin/reload_database ]; then
			/usr/bin/reload_database
		fi
		msg "Running Steven Rostedt's make localmodconfig now"
		make localmodconfig
	fi

	if [ $_localyescfg = "y" ]; then
		msg "Running make localyesconfig"
		make localyesconfig
	fi

	if [ $_makenconfig = "y" ]; then
		msg "Running make nconfig"
		make nconfig
	fi

	msg "Running make bzImage and modules"
	make bzImage modules
}

package_kernel26-ideapad() {
_Kpkgdesc='ARCH kernel with Brain Fuck Scheduler v0.406 and the ck2 patch set, built for Lenovo Y5xx laptops.'
pkgdesc="${_Kpkgdesc}"
provides=("kernel26-ideapad=${pkgver}")
backup=(etc/mkinitcpio.d/kernel26-ideapad.preset)
depends=('coreutils' 'linux-firmware' 'module-init-tools>=3.12-2' 'mkinitcpio>=0.6.8-2')
install=kernel26.install
#conflicts=('kernel26-ideapad')
#groups=('ck-generic')
optdepends=('crda: to set the correct wireless channels of your country'
'lirc-ck: Linux Infrared Remote Control kernel modules for kernel26-ideapad'
'nvidia-ck: nVidia drivers for kernel26-ideapad'
'nvidia-beta-ck: nVidia beta drivers for kernel26-ideapad'
'modprobed_db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')

KARCH=x86
cd ${srcdir}/linux-$_basekernel
#get kernel version
_kernver="$(make kernelrelease)"
mkdir -p ${pkgdir}/{lib/modules,lib/firmware,boot}
msg "Running make modules_install"
make INSTALL_MOD_PATH=${pkgdir} modules_install
cp System.map ${pkgdir}/boot/System.map26${_kernelname}
cp arch/$KARCH/boot/bzImage ${pkgdir}/boot/vmlinuz26${_kernelname}

# add vmlinux
install -m644 -D vmlinux ${pkgdir}/usr/src/linux-${_kernver}/vmlinux

# install fallback mkinitcpio.conf file and preset file for kernel
install -m644 -D ${srcdir}/kernel26.preset ${pkgdir}/etc/mkinitcpio.d/kernel26-ideapad.preset

# set correct depmod command for install
sed \
	-e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
	-e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
	-i $startdir/kernel26.install
sed -e "s|source .*|source /etc/mkinitcpio.d/kernel26${_kernelname}.kver|g" \
	-e "s|default_image=.*|default_image=\"/boot/kernel26-ideapad.img\"|g" \
	-e "s|fallback_image=.*|fallback_image=\"/boot/kernel26-ideapad-fallback.img\"|g" \
	-i ${pkgdir}/etc/mkinitcpio.d/kernel26-ideapad.preset

echo -e "# DO NOT EDIT THIS FILE\nALL_kver='${_kernver}'" > ${pkgdir}/etc/mkinitcpio.d/kernel26-ideapad.kver

# remove build and source links
rm -f ${pkgdir}/lib/modules/${_kernver}/{source,build}

# remove the firmware
rm -rf ${pkgdir}/lib/firmware

# gzip -9 all modules to save 100MB of space
find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;
}

package_kernel26-ideapad-headers() {
_Hpkgdesc='Header files and scripts to build modules for kernel26-ideapad.'
pkgdesc="${_Hpkgdesc}"
#conflicts=('kernel26-ideapad-headers')
#groups=('ck-generic')
provides=("kernel26-ideapad-headers=${pkgver}" "kernel26-headers=${pkgver}")

mkdir -p ${pkgdir}/lib/modules/${_kernver}
cd ${pkgdir}/lib/modules/${_kernver}
ln -sf ../../../usr/src/linux-${_kernver} build
cd ${srcdir}/linux-$_basekernel
install -D -m644 Makefile \
	${pkgdir}/usr/src/linux-${_kernver}/Makefile
install -D -m644 kernel/Makefile \
	${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
install -D -m644 .config \
	${pkgdir}/usr/src/linux-${_kernver}/.config
mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include

for i in acpi asm-generic config crypto drm generated linux math-emu \
	media net pcmcia scsi sound trace video xen; do
cp -a include/$i ${pkgdir}/usr/src/linux-${_kernver}/include/
	done

	# copy arch includes for external modules
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/x86
	cp -a arch/x86/include ${pkgdir}/usr/src/linux-${_kernver}/arch/x86/

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

	# add headers for lirc package
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video
	cp drivers/media/video/*.h  ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/
	for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102; do
		mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/$i
		cp -a drivers/media/video/$i/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/$i
	done
	# add docbook makefile
	install -D -m644 Documentation/DocBook/Makefile \
		${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile
	# add dm headers
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/md
	cp drivers/md/*.h  ${pkgdir}/usr/src/linux-${_kernver}/drivers/md
	# add inotify.h
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/linux
	cp include/linux/inotify.h ${pkgdir}/usr/src/linux-${_kernver}/include/linux/
	# add wireless headers
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/
	cp net/mac80211/*.h ${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/
	# add dvb headers for external modules
	# in reference to:
	# http://bugs.archlinux.org/task/9912
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core
	cp drivers/media/dvb/dvb-core/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core/
	# add dvb headers for external modules
	# in reference to:
	# http://bugs.archlinux.org/task/11194
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
	# fix if user disables dvb support
	[[ -e include/config/dvb/ ]] && cp include/config/dvb/*.h ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
	# add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
	# in reference to:
	# http://bugs.archlinux.org/task/13146
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
	cp drivers/media/dvb/frontends/lgdt330x.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
	cp drivers/media/video/msp3400-driver.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
	# add dvb headers
	# in reference to:
	# http://bugs.archlinux.org/task/20402
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb
	cp drivers/media/dvb/dvb-usb/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb/
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends
	cp drivers/media/dvb/frontends/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners
	cp drivers/media/common/tuners/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners/
	# add xfs and shmem for aufs building
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/fs/xfs
	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/mm
	cp fs/xfs/xfs_sb.h ${pkgdir}/usr/src/linux-${_kernver}/fs/xfs/xfs_sb.h
	# copy in Kconfig files
	for i in `find . -name "Kconfig*"`; do
		mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/`echo $i | sed 's|/Kconfig.*||'`
		cp $i ${pkgdir}/usr/src/linux-${_kernver}/$i
	done

	chown -R root.root ${pkgdir}/usr/src/linux-${_kernver}
	find ${pkgdir}/usr/src/linux-${_kernver} -type d -exec chmod 755 {} \;
	# strip scripts directory
	find ${pkgdir}/usr/src/linux-${_kernver}/scripts  -type f -perm -u+w 2>/dev/null | while read binary ; do
	case "$(file -bi "$binary")" in
		*application/x-sharedlib*) # Libraries (.so)
			/usr/bin/strip $STRIP_SHARED "$binary";;
		*application/x-archive*) # Libraries (.a)
			/usr/bin/strip $STRIP_STATIC "$binary";;
		*application/x-executable*) # Binaries
			/usr/bin/strip $STRIP_BINARIES "$binary";;
	esac
done

# remove unneeded architectures
rm -rf ${pkgdir}/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa}
}
# Global pkgdesc and depends are here so that they will be picked up by AUR
pkgdesc='ARCH kernel with Brain Fuck Scheduler v0.406 and the ck2 patch set, built for Lenovo Y5xx laptops.'

md5sums=('1aab7a741abe08d42e8eccf20de61e05'
         'b23d7def30e57242cfe088f4d8ca8baa'
         'cb90a186fc83ac0f181150a82d23735b'
         '137daaabe56f8c83dfc2cbae206219f9'
         '83abff309b5a504db70b051005a594d0'
         'ffa0384d5a243d17ca47c9bd0e2217e7'
         '199921265a39fbe7e8370c6432548ec3'
         'f71db44b8aabf407c7ea9591b6ba2488'
         'cbae3fd91c29e692fb19488dedc4f9db'
         '0ab7720f0d80d142a280cfe35b9a8730'
         'e8c333eaeac43f5c6a1d7b2f47af12e2'
         '5974286ba3e9716bfbad83d3f4ee985a'
         'a6f0377c814da594cffcacbc0785ec1a')
