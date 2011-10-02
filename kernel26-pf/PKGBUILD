# Maintainer: Christos Nouskas <nous at archlinux dot us>
# PKGBUILD assembled from kernel26, kernel26-bfs, kernel26-ck
# Credit to respective maintainers

_major=2
_minor=6
_patchlevel=39
_subversion=1
_basekernel=$_major.$_minor.$_patchlevel
_pkgname=kernel26-pf
_pfrel=pf3
_kernelname=-pf
_chakrapatches="http://chakra-project.org/sources/linux/patches/${_major}.${_minor}/features/aufs2.2"
_aufs2rel=35-20110815
_pfpatchhome="http://pf.natalenko.name/sources/${_basekernel}/"
_pfpatchname="patch-${_basekernel}-${_pfrel}.bz2"

pkgname=kernel26-pf
pkgver=${_basekernel}
pkgrel=${_pfrel}
arch=(i686 x86_64)
_pkgdesc="Linux kernel and modules with pf-kernel patch [-ck patchset (BFS included), TuxOnIce, BFQ], aufs2 and squashfs-lzma."
pkgdesc=${_pkgdesc}
license=('GPL2')
groups=('base')
url="http://pf.natalenko.name/"
backup=(etc/mkinitcpio.d/${_pkgname}.preset)
options=(!strip)
depends=('coreutils' 'linux-firmware' 'module-init-tools>=3.12-2' 'mkinitcpio>=0.6.8-2')
makedepends=('xmlto' 'docbook-xsl')
optdepends=('kernel26-docs: Kernel hackers manual - HTML documentation that comes with the Linux kernel.'
	    'crda: to set the correct wireless channels of your country'
	    'pm-utils: utilities and scripts for suspend and hibernate power management'
	    'tuxonice-userui: TuxOnIce userspace user interface'
	    'hibernate-script: set of scripts for managing TuxOnIce, hibernation and suspend to RAM'
	    'nvidia-pf: NVIDIA drivers for kernel26-pf'
	    'nvidia-beta-all: NVIDIA drivers for all installed kernels'
	    'modprobed_db: Keeps track of EVERY kernel module that has ever been probed. Useful for make localmodconfig.')
replaces=('kernel24' 'kernel24-scsi' 'kernel26-scsi'
          'alsa-driver' 'ieee80211' 'hostap-driver26'
          'pwc' 'nforce' 'squashfs' 'unionfs' 'ivtv'
          'zd1211' 'kvm-modules' 'iwlwifi' 'rt2x00-cvs'
          'gspcav1' 'atl2' 'wlan-ng26' 'rt2500' 'aufs2'
          'nouveau-drm')
#conflicts=(kernel26-pf-core2 kernel26-pf-k8 kernel26-pf-psc kernel26-pf-atom kernel26-pf-k7 kernel26-pf-p3 kernel26-pf-pm kernel26-pf-p4)
conflicts=()
#provides=(${_pkgname}=${_basekernel} 'aufs2')	# for $pkgname-optimized
provides=(${_pkgname}=${_basekernel} 'aufs2')
# below 'provides' is for when you have no other kernel (which is a bad idea anyway)
# provides=(${_pkgname}=${_basekernel} 'kernel26-headers' 'kernel26=${pkgver}' 'aufs2')
install='kernel26.install'

source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-${_basekernel}.tar.bz2
	config config.x86_64		# the main kernel config files
	kernel26.preset			# standard config files for mkinitcpio ramdisk
	logo_linux_clut224.ppm.bz2
	logo_linux_mono.pbm.bz2		# the archlinux boot logos
	logo_linux_vga16.ppm.bz2
#	aufs2-base.patch::${_chakrapatches}/aufs2-base-${_aufs2rel}.patch
#	aufs2-kbuild.patch::${_chakrapatches}/aufs2-kbuild-${_aufs2rel}.patch
#	aufs2-standalone.patch::${_chakrapatches}/aufs2-standalone-${_aufs2rel}.patch
#	aufs2.2-$_aufs2rel.patch.bz2::${_chakrapatches}/aufs2.2-standalone.tree-${_aufs2rel}.patch.bz2
	channel-negative-one-maxim.patch	# hopefully fix "channel -1" aireplay-ng error
	${_pfpatchhome}${_pfpatchname})	# the -pf patchset

build() {

  cd ${srcdir}/linux-${_basekernel}
  # This is for me, to test the PKGBUILD
  if [[ $NOEXTRACT = "0" ]]; then
     # Arch linux logo
     msg "Replacing penguins with arches"
     bzip2 -dk ${startdir}/logo_linux_*.bz2
     mv -f ${startdir}/logo_linux_*.p?m drivers/video/logo/
     msg "Applying pf-kernel patch"
     bzip2 -dc ${srcdir}/${_pfpatchname} | patch -Np1
     msg "Applying aufs2 patches"
#     patch -Np1 < ${srcdir}/aufs2-base.patch
#     patch -Np1 < ${srcdir}/aufs2-kbuild.patch
#     patch -Np1 < ${srcdir}/aufs2-standalone.patch
#     bzip2 -dc ${srcdir}/aufs2.2-${_aufs2rel}.patch.bz2 | patch -Np1
     patch -Np1 < ${srcdir}/channel-negative-one-maxim.patch
     if [ "$CARCH" = "x86_64" ]; then
	cat ${startdir}/config.x86_64 >| .config
     else
	cat ${startdir}/config >| .config
     fi
  fi
  sed -i "s/EXTRAVERSION = -${_pfrel}/EXTRAVERSION = ${_kernelname}/" Makefile
  _arch=$CARCH

#----------------------------------------
if [[ "$_BATCH" != "y" ]]; then		# batch building for [pfkernel] repo
  echo
  echo "======================================================="
  msg "You might be prompted below for some config options"
  echo "======================================================="
  echo
  msg "Hit <Y> to use your running kernel's config"
  echo "    (needs IKCONFIG and IKCONFIG_PROC)"
  msg "Hit <L> to run make localmodconfig"
  msg "Hit <N> (or just <ENTER>) to build an all-inclusive kernel like stock -ARCH"
  echo "    (warning: it can take a looong time)"
  echo
  read answer
  shopt -s nocasematch
  if [[ "$answer" = "y" ]]; then
     msg "running 'sudo modprobe configs'"
     sudo modprobe configs
     if [[ -s /proc/config.gz ]]; then
	msg "Extracting config from /proc/config.gz..."
	zcat /proc/config.gz >| ./.config
     else
	msg "You kernel was not compiled with IKCONFIG_PROC."
	# Copied from kernel26-ck's PKGBUILD
	msg "Attempting to run /usr/bin/reload_database from modprobe_db..."
	if [ -e /usr/bin/reload_database ]; then
	   /usr/bin/reload_database
	fi
	msg "Running make localmodconfig instead..."
	chmod +x ./scripts/kconfig/streamline_config.pl
	./scripts/kconfig/streamline_config.pl >| config_strip
	mv config_strip .config
     fi
  elif [[ "$answer" = "l" ]]; then
     # Copied from kernel26-ck's PKGBUILD
     msg "Attempting to run /usr/bin/reload_database from modprobe_db..."
     if [ -e /usr/bin/reload_database ]; then
	/usr/bin/reload_database
     fi
     msg "Running the functional equivalent of make localmodconfig now..."
     chmod +x ./scripts/kconfig/streamline_config.pl
     ./scripts/kconfig/streamline_config.pl >| config_strip
     mv config_strip .config
     msg "An error about ksource in line 118 blah blah is NORMAL as is one about nvidia config too!"
  else
     msg "Using stock ARCH kernel .config (with BFS, BFQ and TuxOnIce enabled)."
  fi

  # Make some good use of MAKEFLAGS
  # MAKEFLAGS=`grep -v '#' /etc/makepkg.conf | grep MAKEFLAGS= | sed s/MAKEFLAGS=// | sed s/\"//g`
  # make prepare

  # Option for make menuconfig
  echo


  msg "Kernel configuration options before build:"
  echo "    <M> make menuconfig (console menu)"
  echo "    <N> make nconfig (newer alternative to menuconfig)"
  echo "    <G> make gconfig (needs gtk)"
  echo "    <X> make xconfig (needs qt)"
  echo "    <O> make oldconfig"
  echo "    <ENTER> to skip configuration and start compiling"
  read answer
  case "$answer" in
   m) make menuconfig
      ;;
   g) make gconfig
      ;;
   x) make xconfig
      ;;
   n) make nconfig
      ;;
   o) make oldconfig
      ;;
   default)
      ;;
  esac
  cp -v .config ${startdir}/config.local
  CPU=`egrep "MK8=y|MCORE2=y|MPSC=y|MATOM=y|MPENTIUMII=y|MPENTIUMIII=y|MPENTIUMM=y|MPENTIUM4=y|MK7=y|CONFIG_GENERIC_CPU=y|M686=y" ./.config`
  CPU=`sed -e "s/CONFIG_M\(.*\)=y/\1/" <<<$CPU`
  CPU=`sed -e "s/CONFIG_GENERIC_CPU=y/GENERIC/" <<<$CPU`
  CPU=`sed -e "s/^686$/GENERIC/" <<<$CPU`
  cp -v .config ${startdir}/config.$CPU-$CARCH

  # Give option to rename package according to CPU
  echo
  echo "=============================================================="
  msg "Hit <ENTER>: to create a package named kernel26-pf"
  echo "             regardless of the CPU selected in config (recommended)"
  msg "Hit <P>    : to create a package named after the CPU selected"
  echo "             (e.g. kernel26-pf-core2 - for advanced users)"
  echo
  msg "This option affects ONLY the package name. Whether or not the"
  msg "kernel is optimized was determined at the previous config step."
  echo "=============================================================="
  read answer
  shopt -s nocasematch
  if [[ "$answer" = "p" ]]; then
     export _PKGOPT=y
  fi
fi	# batch check ends here
#----------------------------------------

  # Strip config of uneeded localversion
  if [ "${_kernelname}" != "" ]; then
     sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"\"|g" ./.config
  fi

  # load configuration
  # yes "" | make config
  # Useful for repo maintainers.

  # build!
  make bzImage modules
}

package() {
  KARCH=x86
  cd ${srcdir}/linux-${_basekernel}
  _kernver=$(make kernelrelease)

  # work around the AUR parser
  # This allows building cpu-optimized packages with according package names.
  # Useful for repo maintainers.
  if [[ "$_PKGOPT" = "y" ]]; then	# package naming according to optimization
    CPU=`egrep "MK8=y|MCORE2=y|MPSC=y|MATOM=y|MPENTIUMII=y|MPENTIUMIII=y|MPENTIUMM=y|MPENTIUM4=y|MK7=y|CONFIG_GENERIC_CPU=y|M686=y" ./.config`
    CPU=`sed -e "s/CONFIG_M\(.*\)=y/\1/" <<<$CPU`
    case $CPU in
     CORE2)
         pkgname="${_pkgname}-core2"
         pkgdesc="${_pkgdesc} Intel Core2 optimized."
         ;;
     K8)
         pkgname="${_pkgname}-k8"
         pkgdesc="${_pkgdesc} AMD K8 optimized."
         ;;
     PSC)
         pkgname="${_pkgname}-psc"
         pkgdesc="${_pkgdesc} Intel Pentium4/D/Xeon optimized."
         ;;
     ATOM)
         pkgname="${_pkgname}-atom"
         pkgdesc="${_pkgdesc} Intel Atom optimized."
         ;;
     K7)
         pkgname="${_pkgname}-k7"
         pkgdesc="${_pkgdesc} AMD K7 optimized."
         ;;
     PENTIUMII)
         pkgname="${_pkgname}-p2"
         pkgdesc="${_pkgdesc} Intel Pentium2 optimized."
         ;;
     PENTIUMIII)
         pkgname="${_pkgname}-p3"
         pkgdesc="${_pkgdesc} Intel Pentium3 optimized."
         ;;
     PENTIUMM)
         pkgname="${_pkgname}-pm"
         pkgdesc="${_pkgdesc} Intel Pentium-M optimized."
         ;;
     PENTIUM4)
         pkgname="${_pkgname}-p4"
         pkgdesc="${_pkgdesc} Intel Pentium4 optimized."
         ;;
     default)
# Note to me: DO NOT EVER REMOVE THIS. It's for the AUR PKGBUILD parser.
         pkgname="${_pkgname}"
         pkgdesc="Linux kernel and modules with pf-kernel patch [-ck patchset (BFS included), TuxOnIce, BFQ], aufs2 and squashfs-lzma."
         conflicts=(kernel26-pf-core2 kernel26-pf-k8 kernel26-pf-psc kernel26-pf-atom kernel26-pf-k7 kernel26-pf-p3 kernel26-pf-pm kernel26-pf-p4)
         ;;
    esac

    if [[ "$pkgname" != "$_pkgname" ]]; then
       conflicts=('kernel26-pf')
    fi

    echo
    echo "======================================="
    msg  "The package will be named ${pkgname}"
    msg  "${pkgdesc}"
    echo "======================================="
    echo
  # second batch check ends here
  fi

  ### package_kernel26

  mkdir -p ${pkgdir}/{lib/modules,/lib/firmware,boot}
  make INSTALL_MOD_PATH=${pkgdir} modules_install

  cp System.map ${pkgdir}/boot/System.map26${_kernelname}
  cp arch/$KARCH/boot/bzImage ${pkgdir}/boot/vmlinuz26${_kernelname}

  # add vmlinux
  install -m644 -D vmlinux ${pkgdir}/usr/src/linux-${_kernver}/vmlinux

  # install fallback mkinitcpio.conf file and preset file for kernel
  # make sure ${_pkgname} is used for the mkinitcpio process
  install -m644 -D ${srcdir}/kernel26.preset ${pkgdir}/etc/mkinitcpio.d/${_pkgname}.preset

  # set correct depmod command for install
  sed \
     -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
     -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
     -i ${startdir}/kernel26.install
  sed \
     -e "s|source .*|source /etc/mkinitcpio.d/kernel26${_kernelname}.kver|g" \
     -e "s|default_image=.*|default_image=\"/boot/${_pkgname}.img\"|g" \
     -e "s|fallback_image=.*|fallback_image=\"/boot/${_pkgname}-fallback.img\"|g" \
     -i ${pkgdir}/etc/mkinitcpio.d/${_pkgname}.preset

  echo -e "# DO NOT EDIT THIS FILE\nALL_kver='${_kernver}'" > ${pkgdir}/etc/mkinitcpio.d/${_pkgname}.kver

  # remove build and source links
  rm -f ${pkgdir}/lib/modules/${_kernver}/{source,build}
  cd ${pkgdir}/lib/modules/${_kernver}
  ln -sf ../../../usr/src/linux-${_kernver} build
  # remove the firmware
  rm -rf ${pkgdir}/lib/firmware

  ### package_kernel26-headers
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

  # gzip -9 all modules to save 100MB of space
  msg "Compressing modules..."
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;
}

# makepkg -g >>PKGBUILD
sha256sums=('584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d45c61f6'
            '9da62023a56218f0bae091699ff34906017f3ccf364c33405210b585a622531f'
            '25f6bef4a9a940b8ce3baba58c7f09049db229e5c7ed046b24c3ba12347d0710'
            '3b0aeb055c560acc804fff2eebfb71a64ebd5a535d046e53781f89b5cfba035b'
            '03ed4eb4a35d42ae6beaaa5e6fdbada4244ed6c343944bba6462defaa6fed0bf'
            '51ea665cfec42d9f9c7796af2b060b7edbdeb367e42811f8c02667ad729f6b19'
            '9e1e81d80afac6f316e53947e1b081017090081cd30e6c4c473420b77af4b52b'
            '19f7fc0753636c32026e444e23bd101bd21cfeb59661284678bf157dc35212f2'
            'ba150b5216dd4f818583efd65d093cca27d10c8fb5a30340589cb73567a9b215')
