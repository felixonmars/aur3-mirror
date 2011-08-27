# Maintainer: DonVla <donvla@users.sourceforge.net>

pkgname=kernel26-n130
_kernelname=-N130
_basekernel=2.6.39
_minrev=.1
#pkgver=${_basekernel}
pkgver=${_basekernel}${_minrev}
pkgrel=1
_patchname="patch-${_basekernel}${_minrev}"
_ck_patchver=ck2
_ck_patchname=patch-${_basekernel}-${_ck_patchver}
_bfqver="v2"
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/${_basekernel}"
pkgdesc="The Linux kernel and modules for SAMSUNG N130 - optionally with Con Kolivas' ck patchset and/or BFQ patches"
arch=('i686')
license=('GPL2')
options=(!strip)
provides=('kernel26' 'kernel26-headers')
groups=('base')
url="http://www.kernel.org"
depends=('coreutils' 'lzop' 'module-init-tools' 'mkinitcpio>=0.5.20')
replaces=('kernel24' 'kernel24-scsi' 'kernel26-scsi' 'alsa-driver' 'ieee80211' 'hostap-driver26' 'pwc' 'squashfs' 
          'unionfs' 'ivtv' 'zd1211' 'kvm-modules' 'iwlwifi' 'rt2x00-cvs' 'gspcav1' 'atl2' 'wlan-ng26' 'rt2500')
install="kernel26${_kernelname}.install"
source=("http://www.kernel.org/pub/linux/kernel/v2.6/linux-${_basekernel}.tar.bz2"
        "http://www.kernel.org/pub/linux/kernel/v2.6/${_patchname}.bz2"
        "http://www.kernel.org/pub/linux/kernel/people/ck/patches/2.6/${_basekernel}/${_basekernel}-${_ck_patchver}/${_ck_patchname}.bz2"
        "${_bfqpath}/0001-block-prepare-I-O-context-code-for-BFQ-${_bfqver}-for-${_basekernel}.patch"
        "${_bfqpath}/0002-block-cgroups-kconfig-build-bits-for-BFQ-${_bfqver}-${_basekernel}.patch"
        "${_bfqpath}/0003-block-introduce-the-BFQ-${_bfqver}-I-O-sched-for-${_basekernel}.patch"
        "config" "mkinitcpio-N130.conf" "kernel26-N130.preset"
        logo_linux_{clut224.ppm,mono.pbm,vga16.ppm})
optdepends=('crda: to set the correct wireless channels of your country')
md5sums=('1aab7a741abe08d42e8eccf20de61e05'
         '215f7ebaafe1175dbc5d1e439c9a96d5'
         'ffa0384d5a243d17ca47c9bd0e2217e7'
         '199921265a39fbe7e8370c6432548ec3'
         'f71db44b8aabf407c7ea9591b6ba2488'
         'cbae3fd91c29e692fb19488dedc4f9db'
         '946f70b9d49315831326c1575c007798'
         '4b6c69e33f89072200192f550517c5f0'
         'c92dbaeffaf04501ef9fc15dce4c6a1f'
         '6a5a1925501fe20fafd04fdb3cb4f6ed'
         'e8c333eaeac43f5c6a1d7b2f47af12e2'
         'c120adbd9c0daa0136237a83adeabd1e')
sha256sums=('584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d45c61f6'
            '27c54f9ce3b04371219bda478b4c738fe6d7f58372625fbf0082039ccd994fb2'
            '0f54e42613c5d5a5c23125c108c21378e1a383bb628e5cb72d45d546d2dc0089'
            '7051be08f3318503c30d18f6b18937648074cfccc8c1e052cd296afab47d50fe'
            '0b2bae2acabae85f05913b6c2a1d49e5b19f913df38564bd5eed1ebf884406e0'
            '93d0c86c11e17dc0c3d89ba509537f7f0516bde52189b8c5ef27584871e4b368'
            '7f1ba82e3b4fcf6cfbf5845afbe140b8ec76ca22a8faf5b3ae90bdf0293a85d6'
            '3ba1cd67d422b7420d1bfc6deec3fe5344f0bd9b7915cdc3d21f28009e54feb9'
            '1dd2fd989325bce55652cb816dcd2c886dfbd03be95a7b50a7427ccc8104d7df'
            '4274579ccf42a9acc03283edffea2dda2c4a48e3fd734bbaeada4c16dff9d156'
            '1e5bea8de1c2cc24498fb9a4fdbb313f36f38f671f2bfc46ccf7acbd7958a4b9'
            'f9c7c1275313890fc12f6bab92e2c0794b5041e223d868eb0e34cd99baee3d7a')

build() {
  # change to 1 (or else) if you want to use the BF scheduler
  # http://users.on.net/~ckolivas/kernel/
  _USE_CK_PATCHSET=0
  # change to 1 (or else) if you want to use the BFQ i/o scheduler
  # http://algo.ing.unimo.it/people/paolo/disk_sched/
  _USE_BFQ_PATCHES=0
  # default resume partition -> your swap partition. eg: 
  #_RESUME_SWAP_PARTITION="/dev/sda3"
  # NO PERSISTENT NAMING! If in doubt, leave it empty
  _RESUME_SWAP_PARTITION=""

  cd "${srcdir}/linux-${_basekernel}"

  # Add revision patches
  [[ ! -z "${_minrev}" ]] && msg "Adding revision patches..." && (patch -Np1 < "${srcdir}/${_patchname}")

  # Add Arch Linux logo to the source
  msg "Adding Arch Linux logo..."
  install -v -m 0644 "${srcdir}/logo_linux_clut224.ppm"  drivers/video/logo/logo_linux_clut224.ppm &&
  install -v -m 0644 "${srcdir}/logo_linux_mono.pbm"     drivers/video/logo/logo_linux_mono.pbm &&
  install -v -m 0644 "${srcdir}/logo_linux_vga16.ppm"    drivers/video/logo/logo_linux_vga16.ppm

  # Copy config
  cat ../config > ./.config
  if [[ "${_RESUME_SWAP_PARTITION}" ]]; then 
    sed -e "s|CONFIG_PM_STD_PARTITION=.*|CONFIG_PM_STD_PARTITION=\""${_RESUME_SWAP_PARTITION}"\"|g" -i ./.config
  fi

  ### Additional patches 
  # Add CK's BFS patch
  if (( _USE_CK_PATCHSET )); then 
    msg "Adding CK patchset..." 
    patch -Np1 < "${srcdir}/${_ck_patchname}"
  fi

  if (( _USE_BFQ_PATCHES )); then
    msg "Adding BFQ patches..."
    local _patch
    for _patch in "${srcdir}"/000*-block-*.patch; do
        patch -Np1 < "${_patch}"
    done 
  fi

  # Remove EXTRAVERSION from Makefile. Version will remain ${_basekernel}-${_kernelname}
  sed -e "s/^EXTRAVERSION\ .*/EXTRAVERSION\ = "${_kernelname}"/g" -i Makefile

  make prepare
  ####################
  ###
  ### Configure the kernel and stop afterwards
  ### this is useful to configure the kernel
  #make oldconfig
  ###
  ### This one also moves the config file to ${startdir} for later use. 
  ### Don't forget to rebuild the checksums afterwards! 
  #make menuconfig && cp -v .config ${startdir}/config && msg "Stopping build" && return 1
  ### new nconfig
  #make nconfig && cp -v .config ${startdir}/config && msg "Stopping build" && return 1
  ####################
  yes "" | make config
  # build!
  make ${MAKEFLAGS} bzImage modules
  #make bzImage modules
}

package() {
  KARCH=x86

  cd "${srcdir}/linux-${_basekernel}"
  # Get kernel version  
  _kernver="$(make kernelrelease)"

  ###
  ### install kernel and modules (kernel package)
  ###
  mkdir -p ${pkgdir}/{lib/modules,boot}
  make INSTALL_MOD_PATH=${pkgdir} modules_install
  cp System.map ${pkgdir}/boot/System.map26${_kernelname}
  cp arch/${KARCH}/boot/bzImage ${pkgdir}/boot/vmlinuz26${_kernelname}
  # add vmlinux
  install -m644 -D vmlinux ${pkgdir}/usr/src/linux-${_kernver}/vmlinux

  # install N130 mkinitcpio.conf and preset file for kernel
  install -m644 -D ${srcdir}/mkinitcpio-N130.conf ${pkgdir}/etc/mkinitcpio-N130.conf
  install -m644 -D ${srcdir}/kernel26${_kernelname}.preset ${pkgdir}/etc/mkinitcpio.d/kernel26${_kernelname}.preset

  sed \
    -e "s|source .*|source /etc/mkinitcpio.d/kernel26${_kernelname}.kver|g" \
    -e "s|default_image=.*|default_image=\"/boot/kernel26${_kernelname}.img\"|g" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/kernel26${_kernelname}-fallback.img\"|g" \
    -i ${pkgdir}/etc/mkinitcpio.d/kernel26${_kernelname}.preset

  echo -e "# DO NOT EDIT THIS FILE\nALL_kver='${_kernver}'" > ${pkgdir}/etc/mkinitcpio.d/kernel26${_kernelname}.kver

  # set correct depmod command for install
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i ${startdir}/kernel26${_kernelname}.install

  # remove build and source links
  rm -f ${pkgdir}/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf ${pkgdir}/lib/firmware
  # gzip -9 all modules to safe 100MB of space
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;

  ###
  ### install kernel headers (kernel headers package)
  ###
  mkdir -p "${pkgdir}/lib/modules/${_kernver}"
  cd "${pkgdir}/lib/modules/${_kernver}" && ln -sf ../../../usr/src/linux-${_kernver} build

  cd "${srcdir}/linux-${_basekernel}"
  install -D -m644 Makefile ${pkgdir}/usr/src/linux-${_kernver}/Makefile
  install -D -m644 kernel/Makefile ${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile
  install -D -m644 .config ${pkgdir}/usr/src/linux-${_kernver}/.config

  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include
  for i in acpi asm-generic config crypto generated linux math-emu media net pcmcia scsi sound trace video xen; do
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
  cp arch/$KARCH/Makefile_32.cpu ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/
  cp arch/$KARCH/kernel/asm-offsets.s ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/kernel/

  # add wireless headers
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/
  cp net/mac80211/*.h ${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/
  # add dm headers
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/md
  cp drivers/md/*.h  ${pkgdir}/usr/src/linux-${_kernver}/drivers/md
  # add inotify.h
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/linux
  cp include/linux/inotify.h ${pkgdir}/usr/src/linux-${_kernver}/include/linux/
  # add dvb and tuner headers for external modules
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
  cp include/config/dvb/*.h ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core
  cp drivers/media/dvb/dvb-core/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core/
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb
  cp drivers/media/dvb/dvb-usb/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb/
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends
  cp drivers/media/dvb/frontends/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners
  cp drivers/media/common/tuners/*.h ${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners/
  # add headers for virtualbox
  cp -a include/drm $pkgdir/usr/src/linux-${_kernver}/include/
  # add headers for crypto modules in reference to: http://bugs.archlinux.org/task/22081
  cp -a include/crypto ${pkgdir}/usr/src/linux-${_kernver}/include/

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
