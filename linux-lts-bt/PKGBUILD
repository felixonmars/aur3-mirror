# arch/core/linux-lts PKGBUILD
# Tobias Powalowski <tpowa@archlinux.org>
# Thomas Baechler <thomas@archlinux.org>

pkgbase=linux-lts-bt
_srcname=linux-3.14
pkgver=3.14.43
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc')
provides=('linux-lts' 'linux-tomoyo' 'linux-lts-bfq')
options=('!strip')
_bfqpath='http://algo.ing.unimo.it/people/paolo/disk_sched/patches'
_bfqk='3.14.0'
_bfqvr='v7r7'
_bfqpatch1="0001-block-cgroups-kconfig-build-bits-for-BFQ-${_bfqvr}-${_bfqk%.0}.patch"
_bfqpatch2="0002-block-introduce-the-BFQ-${_bfqvr}-I-O-sched-for-${_bfqk%.0}.patch"
_bfqpatch3="0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-${_bfqvr}-for-${_bfqk}.patch"
source=("${_bfqpath}/${_bfqk}-${_bfqvr}/${_bfqpatch1}"
        "${_bfqpath}/${_bfqk}-${_bfqvr}/${_bfqpatch2}"
        "${_bfqpath}/${_bfqk}-${_bfqvr}/${_bfqpatch3}"
        # bfq patches
        https://www.kernel.org/pub/linux/kernel/v3.x/${_srcname}.tar.{xz,sign}
        https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.{xz,sign}
        # the main kernel config files
        'config' 'config.x86_64'
        # standard config files for mkinitcpio ramdisk
        "$pkgbase.preset"
        'change-default-console-loglevel.patch'
        '0001-Bluetooth-allocate-static-minor-for-vhci.patch'
        '0002-module-allow-multiple-calls-to-MODULE_DEVICE_TABLE-p.patch'
        '0003-module-remove-MODULE_GENERIC_TABLE.patch'
        '0006-genksyms-fix-typeof-handling.patch'
        'md-raid0-fix-restore-to-sector-variable-in-raid0_mak.patch'
        'gcc5_buildfixes.diff'
        )
# https://www.kernel.org/pub/linux/kernel/v3.x/sha256sums.asc
sha256sums=('5455355b5442b4fa97ae085960cff4b1294341e665df5afe27ad5d07103b1b5b'
            '95c791d8b258e4128a5749ae11deea80b39dbe99a83e21d4c6a76aca7c84ce0e'
            '09ff6464d73569cd9f0b76f288b613de1b2c99608b1e55ab9d00759b137a4033'
            '61558aa490855f42b6340d1a1596be47454909629327c49a5e4e10268065dffa'
            'SKIP'
            'cd6b9f6c9634605db129030ee2f5082903d59a21381fb2c00bbb25e7931432fd'
            'SKIP'
            '999486d20e07e489bb42356b529b739c65ad65de9191282f0ddbbc0eb9b1718e'
            '140098de1ba714c5916ea76578b8bf549ce801c4aa0c786b7c90289b85ecdb77'
            '218ecc3573f07b1688be101a6211bd563b8229b6d43d771973d6b82d88d87f6c'
            'faced4eb4c47c4eb1a9ee8a5bf8a7c4b49d6b4d78efbe426e410730e6267d182'
            '6d72e14552df59e6310f16c176806c408355951724cd5b48a47bf01591b8be02'
            '52dec83a8805a8642d74d764494acda863e0aa23e3d249e80d4b457e20a3fd29'
            '65d58f63215ee3c5f9c4fc6bce36fc5311a6c7dbdbe1ad29de40647b47ff9c0d'
            'cf2e7a2d00787f754028e7459688c2755a406e632ce48b60952fa4ff7ed6f4b7'
            'bc83293e64653d60793708a0e277741f57c018f5ea3551a8aff3a220df917ceb'
            '470d6d019d288dce02b4a9758a34ea71d41715663a19a164749212a470a131e7')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds <torvalds@linux-foundation.org>
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman (Linux kernel stable release signing key) <greg@kroah.com>
             )
_kernelname=${pkgbase#linux}

prepare() {
  cd "${srcdir}/${_srcname}"

  # add upstream patch
  patch -p1 -i "${srcdir}/patch-${pkgver}"

  # https://bugzilla.kernel.org/show_bug.cgi?id=98501
  patch -Np1 -i "${srcdir}/md-raid0-fix-restore-to-sector-variable-in-raid0_mak.patch"

  # buildfixes for gcc5
  # https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/scsi/qla2xxx/qla_nx2.c?id=9493c2422cae272d6f1f567cbb424195defe4176
  # https://lkml.org/lkml/2014/11/9/27
  # https://lkml.org/lkml/2014/12/14/55
  patch -p1 -i "${srcdir}/gcc5_buildfixes.diff"

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

  # Fix vhci warning in kmod (to restore every kernel maintainer's sanity)
  patch -p1 -i "${srcdir}/0001-Bluetooth-allocate-static-minor-for-vhci.patch"

  # Fix atkbd aliases
  patch -p1 -i "${srcdir}/0002-module-allow-multiple-calls-to-MODULE_DEVICE_TABLE-p.patch"
  patch -p1 -i "${srcdir}/0003-module-remove-MODULE_GENERIC_TABLE.patch"

  # Fix generation of symbol CRCs
  # http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=dc53324060f324e8af6867f57bf4891c13c6ef18
  patch -p1 -i "${srcdir}/0006-genksyms-fix-typeof-handling.patch"

  # Apply BFQ patches
  for p in $(ls ${srcdir}/000{1,2,3}-block*.patch); do
    patch -Np1 -i "$p"
  done

  if [ "${CARCH}" = "x86_64" ]; then
    cat "${srcdir}/config.x86_64" > ./.config
  else
    cat "${srcdir}/config" > ./.config
  fi

  # Disable NUMA for mono-socket system
  if [ "${CARCH}" = "x86_64" ]; then
    msg "Disabling NUMA from kernel config..."
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

  # Set CPU
  msg "Setting CPU to Core2/Xeon..."
  sed -i -e 's/# CONFIG_MCORE2 is not set/CONFIG_MCORE2=y/' \
      -i -e 's/CONFIG_GENERIC_CPU=y/# CONFIG_GENERIC_CPU is not set/' \
      -i -e '/CONFIG_X86_L1_CACHE_SHIFT=6/a CONFIG_X86_INTEL_USERCOPY=y\nCONFIG_X86_USE_PPRO_CHECKSUM=y\nCONFIG_X86_P6_NOP=y' \
      -i -e '/CONFIG_NR_CPUS/ s,128,16,' ./.config

  sed -i -e '/CONFIG_MICROCODE/ s,m,y,' \
      -i -e 's/# CONFIG_MICROCODE_INTEL_EARLY is not set/ CONFIG_MICROCODE_INTEL_EARLY=y/' \
      -i -e 's/# CONFIG_MICROCODE_AMD_EARLY is not set/ CONFIG_MICROCODE_AMD_EARLY=y\nCONFIG_MICROCODE_EARLY=y/' ./.config

  # Set clock
  msg "Setting clock to 1000Hz..."
  sed -i -e 's/CONFIG_HZ_100=y/# CONFIG_HZ_100 is not set/' \
      -i -e 's/CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
      -i -e 's/CONFIG_HZ=100/CONFIG_HZ=1000/' ./.config

  # Enable voluntary preempt
  msg "Enabling Voluntary Preempt..."
  sed -i -e 's/CONFIG_PREEMPT_NONE=y/# CONFIG_PREEMPT_NONE is not set/' \
      -i -e 's/# CONFIG_PREEMPT_VOLUNTARY is not set/CONFIG_PREEMPT_VOLUNTARY=y/' ./.config

  # Enable TOMOYO Linux
  msg "Enabling TOMOYO Linux..."
  sed -i -e 's:# CONFIG_SECURITY_TOMOYO is not set:CONFIG_SECURITY_TOMOYO=y\nCONFIG_SECURITY_TOMOYO_MAX_ACCEPT_ENTRY=2048\nCONFIG_SECURITY_TOMYO_MAX_AUDIT_LOG=1024\n# CONFIG_SECURITY_TOMOYO_OMIT_USERSPACE_LOADER is not set\nCONFIG_SECURITY_TOMOYO_POLICY_LOADER="/sbin/tomoyo-init"\nCONFIG_SECURITY_TOMOYO_ACTIVATION_TRIGGER="/sbin/init":' \
      -i -e 's/CONFIG_DEFAULT_SECURITY_DAC=y/# CONFIG_DEFAULT_DAC is not set/' \
      -i -e '/CONFIG_DEFAULT_SECURITY/ s,"","tomoyo",' ./.config

  # Set BFQ as default io-scheduler
  msg "Setting BFQ as default I/O scheduler..."
  sed -i -e '/CONFIG_DEFAULT_IOSCHED/ s,deadline,bfq,' \
      -i -e 's/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set\nCONFIG_DEFAULT_BFQ=y/' ./.config

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # get kernel version
  make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  # ... or manually edit .config

  # rewrite configuration
  yes "" | make config >/dev/null
}

build() {
  cd "${srcdir}/${_srcname}"

  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
  [ "${pkgbase}" = "linux" ] && groups=('base')
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("kernel26${_kernelname}=${pkgver}")
  conflicts=("kernel26${_kernelname}")
  replaces=("kernel26${_kernelname}")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux-lts-bt.install

  cd "${srcdir}/${_srcname}"

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/${pkgbase}.preset" \
    "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # gzip -9 all modules to save 100MB of space
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--ARCH}" \
    "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > \
    "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  provides=("kernel26${_kernelname}-headers=${pkgver}")
  conflicts=("kernel26${_kernelname}-headers")
  replaces=("kernel26${_kernelname}-headers")

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${srcdir}/${_srcname}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

  for i in acpi asm-generic config crypto drm generated keys linux math-emu \
    media net pcmcia scsi sound trace uapi video xen; do
    cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
  done

  # copy arch includes for external modules
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86"
  cp -a arch/x86/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86/"

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    cp arch/${KARCH}/Makefile_32.cpu \
      "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
  fi

  cp arch/${KARCH}/kernel/asm-offsets.s \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

  # add docbook makefile
  install -D -m644 Documentation/DocBook/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

  # add dm headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

  # add wireless headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"
  cp net/mac80211/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"

  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core"
  cp drivers/media/dvb-core/*.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core/"
  # and...
  # http://bugs.archlinux.org/task/11194
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
  cp include/config/dvb/*.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
  cp drivers/media/i2c/msp3400-driver.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb"
  cp drivers/media/usb/dvb-usb/*.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
  cp drivers/media/dvb-frontends/*.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners"
  cp drivers/media/tuners/*.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners/"

  # add xfs and shmem for aufs building
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/mm"
  cp fs/xfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/xfs_sb.h"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do
    mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
  done

  chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
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
  rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"
  provides=("kernel26${_kernelname}-docs=${pkgver}")
  conflicts=("kernel26${_kernelname}-docs")
  replaces=("kernel26${_kernelname}-docs")

  cd "${srcdir}/${_srcname}"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -al Documentation "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}" -type f -exec chmod 444 {} \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # remove a file already in linux package
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"
}

pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
