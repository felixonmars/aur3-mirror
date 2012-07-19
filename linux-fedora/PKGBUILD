# Maintainer: Brad

pkgbase="linux-fedora"
 pkgname=linux-fedora       # Build kernel with a different name
_kernelname=${pkgname#linux}
_basekernel=3.5
pkgver=${_basekernel}
pkgrel=1
makedepends=('xmlto' 'docbook-xsl')
arch=(i686 x86_64)
license=('GPL2')
url="http://www.kernel.org"
options=(!strip) # v3.x/testing/
source=(http://www.kernel.org/pub/linux/kernel/v3.x/testing/linux-${pkgver}-rc7.tar.xz
        # the main kernel config files
        config-i386 config.x86_64
        # standard config files for mkinitcpio ramdisk
        linux-fedora.preset
	arm-smsc-support-reading-mac-address-from-device-tree.patch
	arm-tegra-nvec-kconfig.patch
	disable-i8042-check-on-apple-mac.patch
	disable-threading-in-compression-for-hibernate.patch
	dmar-disable-when-ricoh-multifunction.patch
	efi-dont-map-boot-services-on-32bit.patch
	fix_xen_guest_on_old_EC2.patch
	linux-2.6.30-no-pcspkr-modalias.patch
	linux-2.6-acpi-video-dos.patch
	linux-2.6-defaults-acpi-video.patch
	linux-2.6-e1000-ich9-montevina.patch
	linux-2.6-intel-iommu-igfx.patch
	linux-2.6-serial-460800.patch
	linux-2.6-silence-fbcon-logo.patch
	lis3-improve-handling-of-null-rate.patch
	modpost-add-option-to-allow-external-modules-to-avoi.patch
	power-x86-destdir.patch
	quite-apm.patch
	scsi-sd_revalidate_disk-prevent-NULL-ptr-deref.patch
	unhandled-irqs-switch-to-polling.patch
	utrace35.patch)

build() {
	cd ${srcdir}/linux-${pkgver}-rc7

	# Add  patches
	#patch -Np1 -i ${srcdir}/taint-vbox.patch

	patch -Np1 -i ${srcdir}/linux-2.6-defaults-acpi-video.patch
	patch -Np1 -i ${srcdir}/linux-2.6-acpi-video-dos.patch

	patch -Np1 -i ${srcdir}/linux-2.6.30-no-pcspkr-modalias.patch

	patch -Np1 -i ${srcdir}/linux-2.6-serial-460800.patch

	patch -Np1 -i ${srcdir}/quite-apm.patch
	patch -Np1 -i ${srcdir}/linux-2.6-silence-fbcon-logo.patch
	patch -Np1 -i ${srcdir}/modpost-add-option-to-allow-external-modules-to-avoi.patch

	patch -Np1 -i ${srcdir}/linux-2.6-e1000-ich9-montevina.patch

	# virt + ksm patches
	patch -Np1 -i ${srcdir}/fix_xen_guest_on_old_EC2.patch

	patch -Np1 -i ${srcdir}/linux-2.6-intel-iommu-igfx.patch

	# patches headed upstream
	patch -Np1 -i ${srcdir}/disable-i8042-check-on-apple-mac.patch

	patch -Np1 -i ${srcdir}/dmar-disable-when-ricoh-multifunction.patch

	patch -Np1 -i ${srcdir}/efi-dont-map-boot-services-on-32bit.patch

	patch -Np1 -i ${srcdir}/lis3-improve-handling-of-null-rate.patch

	patch -Np1 -i ${srcdir}/utrace35.patch

	# Flattened devicetree support
	patch -Np1 -i ${srcdir}/arm-smsc-support-reading-mac-address-from-device-tree.patch
	patch -Np1 -i ${srcdir}/arm-tegra-nvec-kconfig.patch

	patch -Np1 -i ${srcdir}/power-x86-destdir.patch

	#rhbz 754518
	patch -Np1 -i ${srcdir}/scsi-sd_revalidate_disk-prevent-NULL-ptr-deref.patch

	# Disable threading in hibernate compression
	patch -Np1 -i ${srcdir}/disable-threading-in-compression-for-hibernate.patch

	patch -Np1 -i ${srcdir}/unhandled-irqs-switch-to-polling.patch

	echo "patching ...done"

	if [ "$CARCH" = "x86_64" ]; then
    		cat ../config.x86_64 >./.config
  	else
    		cat ../config >./.config
  	fi
  	if [ "${_kernelname}" != "" ]; then
    		sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
  	fi

  	make prepare
 
  	yes "" | make config

  	make ${MAKEFLAGS} bzImage modules
}

package() {
	pkgdesc="The Linux Kernel plus Fedora patches, modules and headers with debug enabled for systemtap"
	groups=('base')
  	provides=("linux-fedora=${pkgver}-rc7")
  	conflicts=('kernel26-fedora' 'linux-fedora')
  	replaces=('kernel26-fedora' 'linux-fedora')
  	backup=(etc/mkinitcpio.d/linux-fedora.preset)
  	depends=('coreutils' 'linux-firmware' 'module-init-tools>=3.16' 'mkinitcpio>=0.7')
	  
  	replaces=('kernel24' 'kernel24-scsi' 'kernel26-scsi'
            'alsa-driver' 'ieee80211' 'hostap-driver26'
            'pwc' 'nforce' 'squashfs' 'unionfs' 'ivtv'
            'zd1211' 'kvm-modules' 'iwlwifi' 'rt2x00-cvs'
            'gspcav1' 'atl2' 'wlan-ng26' 'rt2500' 'nouveau-drm')
  	install=linux.install
  	optdepends=('crda: to set the correct wireless channels of your country')

  	KARCH=x86
  	cd ${srcdir}/linux-${pkgver}-rc7
  	# get kernel version
  	_kernver="$(make kernelrelease)"
  	mkdir -p ${pkgdir}/{lib/modules,lib/firmware,boot}
  	make INSTALL_MOD_PATH=${pkgdir} modules_install
  	cp System.map ${pkgdir}/boot/System.map${_kernelname}
  	cp arch/$KARCH/boot/bzImage ${pkgdir}/boot/vmlinuz${_kernelname}
  	#  # add vmlinux
  	install -m644 -D vmlinux ${pkgdir}/usr/src/linux-${_kernver}/vmlinux

  	# install fallback mkinitcpio.conf file and preset file for kernel
  	install -m644 -D ${srcdir}/linux-fedora.preset ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset
  	# set correct depmod command for install
  	sed \
    		-e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
    		-e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    		-i $startdir/linux.install
  	sed \
    		-e "s|source .*|source /etc/mkinitcpio.d/linux${_kernelname}.kver|g" \
    		-e "s|default_image=.*|default_image=\"/boot/${pkgname}.img\"|g" \
    		-e "s|fallback_image=.*|fallback_image=\"/boot/${pkgname}-fallback.img\"|g" \
    		-i ${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset

  	echo -e "# DO NOT EDIT THIS FILE\nALL_kver='${_kernver}'" > ${pkgdir}/etc/mkinitcpio.d/${pkgname}.kver
  	# remove the firmware
  	rm -rf ${pkgdir}/lib/firmware
  	# gzip -9 all modules to safe 100MB of space
  	find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;

  	# Add the headers package
  	mkdir -p ${pkgdir}/lib/modules/${_kernver}
  	cd ${pkgdir}/lib/modules/${_kernver}
	#  ln -sf /usr/src/linux-${_kernver} build
	#  ln -sf ../../../usr/src/linux-${_kernver} build
  	cd ${srcdir}/linux-${pkgver}-rc7
  	install -D -m644 Makefile \
    		${pkgdir}/usr/src/linux-${_kernver}/Makefile
  	install -D -m644 kernel/Makefile \
    		${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
  	install -D -m644 .config \
    		${pkgdir}/usr/src/linux-${_kernver}/.config
  	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include

  	cp -R include/* ${pkgdir}/usr/src/linux-${_kernver}/include/.

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
  	for i in bt8xx cpia2 cx25840 cx88 em28xx pwc saa7134 sn9c102; do
   		mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/$i
   		cp -a drivers/media/video/$i/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/$i
  	done

  	install -D -m644 Documentation/DocBook/Makefile \
    		${pkgdir}/usr/src/linux-${_kernver}/Documentation/DocBook/Makefile

  	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/md
  	cp drivers/md/*.h  ${pkgdir}/usr/src/linux-${_kernver}/drivers/md

  	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/linux
  	cp include/linux/inotify.h ${pkgdir}/usr/src/linux-${_kernver}/include/linux/

  	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/
  	cp net/mac80211/*.h ${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/
  	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core
  	cp drivers/media/dvb/dvb-core/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core/

  	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
  	cp include/config/dvb/*.h ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/

  	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
  	cp drivers/media/dvb/frontends/lgdt330x.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
  	cp drivers/media/video/msp3400-driver.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/

  	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb
  	cp drivers/media/dvb/dvb-usb/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb/
  	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends
  	cp drivers/media/dvb/frontends/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
  	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners
  	cp drivers/media/common/tuners/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners/

  	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/fs/xfs
  	mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/mm
  	cp fs/xfs/xfs_sb.h ${pkgdir}/usr/src/linux-${_kernver}/fs/xfs/xfs_sb.h

  	for i in `find . -name "Kconfig*"`; do 
    		mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/`echo $i | sed 's|/Kconfig.*||'`
    		cp $i ${pkgdir}/usr/src/linux-${_kernver}/$i
  	done

  	chown -R root.root ${pkgdir}/usr/src/linux-${_kernver}
  	find ${pkgdir}/usr/src/linux-${_kernver} -type d -exec chmod 755 {} \;

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

md5sums=('dae9ca5c9a4b9c69c7ee328df7d18ac1'
         '3047e7326ec52a678b8af911c13d0a17'
         '6d788753cc24e8a069ae7b5a1f955903'
         '4a53bf996d106109507451109a5ad2d0'
         '945595e62cfb645eb9b871bd0aac1b90'
         '28c8b2f9aaadda71b429a6198bf540be'
         'b5541dd0d354884dd1ff79d7ad7661f4'
         'a5bb99c0447f8c642a4aca57e7e64b16'
         '93e63afd37c2726d14acce2727d84f17'
         'c0cd97255f54e2f6ecf96f53f8cfdfe6'
         '65f3d623fd0c55bc8d2b90c5083940cb'
         'd0bb7577944432e6f98bb53615da8b34'
         '96bd5bb046edb6de1f713e72fe8c6346'
         'f8d6c746bf81f54ee73e2879c2e0a035'
         '8f9f3da3e4bf88cbac9bf6e27c07dd6d'
         '0634d24b8175ecd7b0dec6a0c2f28429'
         '71e35228aebdcc7e7cadd7215972da2a'
         '13fa4b7b4f5cfaba0c39f3780b3835d0'
         '372f29988424c626f9d21ef1b11ae035'
         'b02ec45b1c752d7ede3f6c65e2878f14'
         '2c784c3385c4e48a4454db84a4b4613c'
         '30b3c640c7375f43ee7f2ad5ff2c9b6d'
         'ec811be83a56734ae01fa5fd91fb29c3'
         'c5bdf57cf0109ce3dbd9b23b37c4b4f3'
         '1e6cb19c47b9c835a4d2ed7507f5374b')
