# Maintainer: Slane <kozak dot szymon at gmail dot com>
# PKGBUILD assembled from kernel26, kernel26-bfs, kernel26-ck, kernel26-pf
# Credit to respective maintainers and milka_witek

_basekernel=2.6.37
_pkgname=kernel26-pf-grsec
_pfrel=pf3
_kernelname=-pf
_pfpatchhome="http://pf.natalenko.name/sources/${_basekernel}/"
_pfpatchname="patch-${_basekernel}-${_pfrel}.bz2"
# fixed compatibility problem between patches (sysctl.c) 
_grsecpatchhome="http://slane.no-ip.org/pub/kernel/"
_grsecpatchname="grsecurity-2.2.1-2.6.37-201101272240-pf3.patch"
pkgname=kernel26-pf-grsec
pkgver=${_basekernel}
pkgrel=${_pfrel}
arch=(i686 x86_64)
_pkgdesc="Linux kernel and modules with pf-kernel and grsecurity patchset [-ck patchset (BFS included), TuxOnIce, BFQ]."
pkgdesc=${_pkgdesc}
license=('GPL2')
groups=('base')
url=('http://grsecurity.net')
backup=(etc/mkinitcpio.d/${_pkgname}.preset)
depends=('coreutils' 'module-init-tools' 'linux-firmware' 'mkinitcpio>=0.5.20')
optdepends=('paxctl: Manages various PaX related program header flags for Elf32, Elf64, binaries'
            'paxtest: PaX regression test suite'
            'gradm: Administrative interface for the grsecurity Role Based Access Control system'
            'checksec: Tool designed to test what standard Linux OS and PaX security features are being used.'
            'pm-utils: utilities and scripts for suspend and hibernate power management'
            'tuxonice-userui: TuxOnIce userspace user interface'
            'hibernate-script: set of scripts for managing TuxOnIce, hibernation and suspend to RAM'
            'modprobed_db: Keeps track of EVERY kernel module that has ever been probed. Useful for make localmodconfig.')
replaces=('kernel24' 'kernel24-scsi' 'kernel26-scsi'
          'alsa-driver' 'ieee80211' 'hostap-driver26'
          'pwc' 'nforce' 'ivtv' 'zd1211' 'kvm-modules' 
          'iwlwifi' 'rt2x00-cvs' 'gspcav1' 'atl2' 
          'wlan-ng26' 'rt2500')
#conflicts=(kernel26-pf-core2 kernel26-pf-k8 kernel26-pf-psc kernel26-pf-atom kernel26-pf-k7 kernel26-pf-p3 kernel26-pf-pm kernel26-pf-p4)
conflicts=()
provides=(${_pkgname}=${_basekernel})	# for $pkgname-optimized
# below 'provides' is for when you have no other kernel (which is a bad idea anyway)
# provides=(${_pkgname}=${_basekernel} 'kernel26-headers' 'kernel26=$pkgver' 'aufs2')
install='kernel26.install'

source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-${_basekernel}.tar.bz2
	config config.x86_64		# the main kernel config files
	kernel26.preset			# standard config files for mkinitcpio ramdisk
	logo_linux_clut224.ppm.bz2
	logo_linux_mono.pbm.bz2		# the archlinux boot logos
	logo_linux_vga16.ppm.bz2
	streamline_config.pl
	${_pfpatchhome}${_pfpatchname} # the -pf patchset
   ${_grsecpatchhome}${_grsecpatchname}) # the grsec patchset

build() {
  cd ${srcdir}/linux-${_basekernel}
  # This is for me, to test the PKGBUILD
  if [[ $NOEXTRACT = "0" ]]; then
     # Arch linux logo
     msg "Replacing penguins with arches"
     bzip2 -dk ${startdir}/logo_linux_*.bz2
     mv -f ${startdir}/logo_linux_*.p?m drivers/video/logo/
     # pf-kernel
     msg "Applying pf-kernel patch" && sleep 3
     bzip2 -dc ${srcdir}/${_pfpatchname} | patch -Np1
     # grsecurity
     msg "Applying grsecurity patchset" && sleep 3
     patch -Np1 < ${srcdir}/${_grsecpatchname}

     if [ "$CARCH" = "x86_64" ]; then
        cat ${startdir}/config.x86_64 >| .config
     else
        cat ${startdir}/config >| .config
     fi
        cat ${startdir}/streamline_config.pl >| scripts/kconfig/streamline_config.pl
  fi
  sed -i "s/EXTRAVERSION = -${_pfrel}/EXTRAVERSION = ${_kernelname}/" Makefile
  _arch=$CARCH

#----------------------------------------
if [[ "$_BATCH" != "y" ]]; then		# for batch building
  echo
  echo "======================================================="
  msg "You might be prompted below for some config options"
  echo "======================================================="
  echo
  msg "Hit <ENTER> (or just <N>) to build an all-inclusive kernel like stock -ARCH"
  echo "(URGENT: change ${startdir}/config! [CONFIG_GRKERNSEC_HIGH=y by default])"
  echo
  msg "Hit <Y> to use your running kernel's config"
  echo "    (needs IKCONFIG and IKCONFIG_PROC)"
  msg "Hit <L> to run make localmodconfig"
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
       msg "Using kernel .config (with BFS, BFQ, TuxOnIce and Grsecurity enabled)."
  fi

  # Make some good use of MAKEFLAGS
  MAKEFLAGS=`grep -v '#' /etc/makepkg.conf | grep MAKEFLAGS= | sed s/MAKEFLAGS=// | sed s/\"//g`
  msg "Make prepare"
  make prepare

  # Option for make menuconfig
  echo
  msg "Run make menuconfig before build? (y/N)"
  read answer
  if [[ "$answer" = "y" ]]; then
     make menuconfig
     cp -v .config ${startdir}/config.local
  fi
  CPU=`egrep "MK8=y|MCORE2=y|MPSC=y|MATOM=y|MPENTIUMII=y|MPENTIUMIII=y|MPENTIUMM=y|MPENTIUM4=y|MK7=y|CONFIG_GENERIC_CPU=y|M686=y" ./.config`
  CPU=`sed -e "s/CONFIG_M\(.*\)=y/\1/" <<<$CPU`
  CPU=`sed -e "s/CONFIG_GENERIC_CPU=y/GENERIC/" <<<$CPU`
  CPU=`sed -e "s/^686$/GENERIC/" <<<$CPU`
  cp -v .config ${startdir}/config.$CPU-$CARCH
fi # batch check ends here
#----------------------------------------

  # Strip config of uneeded localversion
  if [ "${_kernelname}" != "" ]; then
     sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"\"|g" ./.config
  fi

  # build!
  msg "Make"
  make bzImage modules
}

package() {
  KARCH=x86
  cd ${srcdir}/linux-${_basekernel}
  _kernver=$(make kernelrelease)

  # work around the AUR parser
  # This allows building cpu-optimized packages with according package names.
  # Useful for repo maintainers.
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
       pkgdesc="Linux kernel and modules with pf-kernel and grsecurity patchset [-ck patchset (BFS included), TuxOnIce, BFQ]."
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

  ### package_kernel26

  mkdir -p ${pkgdir}/{lib/modules,boot}
  make INSTALL_MOD_PATH=${pkgdir} modules_install

  cp System.map ${pkgdir}/boot/System.map26${_kernelname}-grsec
  cp arch/$KARCH/boot/bzImage ${pkgdir}/boot/vmlinuz26${_kernelname}-grsec

  # add vmlinux
  install -m644 -D vmlinux ${pkgdir}/usr/src/linux-${_kernver}/vmlinux

  # install fallback mkinitcpio.conf file and preset file for kernel
  # make sure ${_pkgname} is used for the mkinitcpio process
  install -m644 -D ${srcdir}/kernel26.preset ${pkgdir}/etc/mkinitcpio.d/${_pkgname}.preset

  # set correct depmod command for install
  #sed \
  #   -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
  #   -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
  #   -i ${startdir}/kernel26.install
  #sed \
  #   -e "s|source .*|source /etc/mkinitcpio.d/kernel26${_kernelname}.kver|g" \
  #   -e "s|default_image=.*|default_image=\"/boot/${_pkgname}.img\"|g" \
  #   -e "s|fallback_image=.*|fallback_image=\"/boot/${_pkgname}-fallback.img\"|g" \
  #   -i ${pkgdir}/etc/mkinitcpio.d/${_pkgname}.preset

  echo -e "# DO NOT EDIT THIS FILE\nALL_kver='${_kernver}'" > ${pkgdir}/etc/mkinitcpio.d/${_pkgname}.kver

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

  for i in acpi asm-generic config generated linux math-emu media net pcmcia scsi sound trace video xen; do
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
  for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102 usbvideo; do
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
  if [[ -d include/config/dvb ]]; then
    mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
    cp include/config/dvb/*.h ${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/
  fi
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
  # add headers vor virtualbox
  # in reference to:
  # http://bugs.archlinux.org/task/14568
  cp -a include/drm $pkgdir/usr/src/linux-${_kernver}/include/
  # add headers for broadcom wl
  # in reference to:
  # http://bugs.archlinux.org/task/14568
  cp -a include/trace $pkgdir/usr/src/linux-${_kernver}/include/
  # add headers for crypto modules
  # in reference to:
  # http://bugs.archlinux.org/task/22081
  cp -a include/crypto $pkgdir/usr/src/linux-${_kernver}/include/
  # copy in Kconfig files
  for i in `find . -name "Kconfig*"`; do 
    mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/`echo $i | sed 's|/Kconfig.*||'`
    cp $i ${pkgdir}/usr/src/linux-${_kernver}/$i
  done

  chown -R root.root ${pkgdir}/usr/src/linux-${_kernver}
  find ${pkgdir}/usr/src/linux-${_kernver} -type d -exec chmod 755 {} \;

  # remove unneeded architectures
  rm -rf ${pkgdir}/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa}
  # make correct build and source links
  rm -f ${pkgdir}/lib/modules/${_kernver}/{source,build}
  cd ${pkgdir}/lib/modules/${_kernver} && \
    (rm -f source build; ln -sf ../../../usr/src/linux-${_kernver} build)

  # remove the firmware
  rm -rf ${pkgdir}/lib/firmware
}

# makepkg -g >>PKGBUILD
sha256sums=('edbf091805414739cf57a3bbfeba9e87f5e74f97e38f04d12060e9e0c71e383a'
            '46fea7163eb586b6baae50a226e8c9b7b057b6c097a152d4c7b0ac376234f32f'
            '43316c9c3478f802837de0a54161b1bd4059b40d408fb16e0036eb623ef63313'
            '7250c85494a256297c015801090f604fcd4b70e422b6df6e3d062ff9936a3d69'
            '03ed4eb4a35d42ae6beaaa5e6fdbada4244ed6c343944bba6462defaa6fed0bf'
            '51ea665cfec42d9f9c7796af2b060b7edbdeb367e42811f8c02667ad729f6b19'
            '9e1e81d80afac6f316e53947e1b081017090081cd30e6c4c473420b77af4b52b'
            '47008d49add12a0e952065dbaa61285f654bf3c3b53d1577baef128b7c0c404b'
            '362331148ae78a66fcfe8f2cf2b55e4e5b589bbab3024c4c864769b3c816707c'
            'a90434e9d096ff172de37a424933a3d65115a3edd90cdfc5c6b178d1bff743a8')
