# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Kelvin Ng (qpalz) <kelvin9302104 at gmail dot com>

### PATCH AND BUILD OPTIONS
# Set these variables to ANYTHING (yes or no or 1 or 0 or "I like icecream") to enable them
_makenconfig=		# tweak kernel options prior to a build via nconfig
_localmodcfg=		# compile ONLY probed modules
_use_current=		# use the current kernel's .config file
_NUMA_off=yes		# Disable NUMA in kernel config
#MAKEFLAGS=

### DOCS
# DETAILS FOR _localmodcfg="y"
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

# DETAILS FOR _use_current="y"
# Enabling this option will use the .config of the RUNNING kernel rather than the ARCH defaults.
# Useful when the package gets updated and you already went through the trouble of customizing your
# config options.  NOT recommended when a new kernel is released, but again, convenient for package bumps.

pkgname=linux-routes
true && pkgname=(linux-routes linux-routes-headers)
_kernelname=-routes
_srcname=linux-3.9
_routesver=3.7-17
pkgver=3.9.6
pkgrel=1
arch=('i686' 'x86_64')
url="http://ja.ssi.bg/"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'inetutils' 'bc')
source=("http://www.kernel.org/pub/linux/kernel/v3.x/${_srcname}.tar.xz"
        "http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
        "http://ja.ssi.bg/routes-${_routesver}.diff"
        'linux-routes.preset'
        'change-default-console-loglevel.patch'
        'config'
        'config.x86_64')
        
prepare() {
    cd "${srcdir}/${_srcname}"

    ### add upstream patch
    msg "Patching kernel patch"
    patch -Np1 -i "${srcdir}/patch-${pkgver}"

    ### set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
    # remove this when a Kconfig knob is made available by upstream
    # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
    msg "Patching set DEFAULT_CONSOLE_LOGLEVEL to 4"
    patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"

    ### Patch source with routes
    msg "Patching with routes"
    patch -Np1 -i "${srcdir}/routes-${_routesver}.diff"

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

    # disable NUMA since 99.9% of users do not have multiple CPUs but do have multiple cores in one CPU
    # see, https://bugs.archlinux.org/task/31187
    if [ -n "$_NUMA_off" ]; then
	if [ "${CARCH}" = "x86_64" ]; then
	    sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
		    -i -e '/CONFIG_AMD_NUMA=y/d' \
		    -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
		    -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
		    -i -e '/# CONFIG_NUMA_EMU is not set/d' \
		    -i -e '/CONFIG_NODES_SHIFT=6/d' \
		    -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
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
    cd "${srcdir}/${_srcname}"

    # get kernel version
    msg "Running make prepare for you to enable patched options of your choosing"
    make prepare

    ### Optionally load needed modules for the make localmodconfig
    # See http://aur.archlinux.org/packages.php?ID=41689
    if [ -n "$_localmodcfg" ]; then
	msg "If you have modprobe_db installed, running it in recall mode now"
	if [ -e /usr/bin/modprobed_db ]; then
	    [[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo. Install via pacman -S sudo and configure to work with this user." && exit 1
	    sudo /usr/bin/modprobed_db recall
	fi
	msg "Running Steven Rostedt's make localmodconfig now"
	make localmodconfig
    fi

    if [ -n "$_makenconfig" ]; then
	msg "Running make nconfig"
	make nconfig
    fi
    
    msg "Running make bzImage and modules"
    make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-routes() {
    _Kpkgdesc="Linux Kernel and modules with Julian Anastasov's Static, Alternative Routes, Dead Gateway Detection, NAT patch"
    pkgdesc="${_Kpkgdesc}"
    depends=('coreutils' 'linux-firmware' 'mkinitcpio>=0.7')
    optdepends=('crda' 'nvidia-routes' 'modprobed_db')
    backup=("etc/mkinitcpio.d/linux-routes.preset")
    install=linux-routes.install

    cd "${srcdir}/${_srcname}"

    KARCH=x86

    # get kernel version
    _kernver="$(make LOCALVERSION= kernelrelease)"
    _basekernel=${_kernver%%-*}
    _basekernel=${_basekernel%.*}

    mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
    make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
    cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-routes"

    # add vmlinux
    install -D -m644 vmlinux "${pkgdir}/usr/src/linux-${_kernver}/vmlinux"

    # set correct depmod command for install
    cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
    true && install=${install}.pkg
    sed \
    -e "s/KERNEL_NAME=.*/KERNEL_NAME=-routes/g" \
    -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i "${startdir}/${install}"

    # install mkinitcpio preset file for kernel
    install -D -m644 "${srcdir}/linux-routes.preset" "${pkgdir}/etc/mkinitcpio.d/linux-routes.preset"
    sed \
    -e "1s|'linux.*'|'linux-routes'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-linux-routes\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-linux-routes.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-linux-routes-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/linux-routes.preset"

    # remove build and source links
    rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
    # remove the firmware
    rm -rf "${pkgdir}/lib/firmware"
    # gzip -9 all modules to save 100MB of space
    find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
    # make room for external modules
    ln -s "../extramodules-${_basekernel}${_kernelname:routes}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
    # add real version for building modules and running depmod from post_install/upgrade
    mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:ukdm}"
    echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:routes}/version"

    # Now we call depmod...
    depmod -b "$pkgdir" -F System.map "$_kernver"

    # move module tree /lib -> /usr/lib
    mv "$pkgdir/lib" "$pkgdir/usr"
}

package_linux-routes-headers() {
    _Hpkgdesc='Header files and scripts to build modules for linux-routes'
    pkgdesc="${_Hpkgdesc}"

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
    [[ -e include/config/dvb/ ]] && cp include/config/dvb/*.h "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/" 

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
    rm -rf "${pkgdir}"/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}

# Global pkgdesc and depends are here so that they will be picked up by AUR
pkgdesc="Linux Kernel and modules with Julian Anastasov's Static, Alternative Routes, Dead Gateway Detection, NAT patch"

sha512sums=('77fa521f42380409f8ab400c26f7b00e225cb075ef40834bb263325cfdcc3e65aef8511ec2fc2b50bbf4f50e226fb5ab07d7a479aaf09162adbbf318325d0790'
            '6c79bde85d86c7e7dca160d5bdd5826ae05ed41cb372d0a94e4f9840413351a8bc1fec50159d59dbac462345bd13c31c6c4d8c47187ee6d87b4d71c8560093da'
            'a42c9b12d52e5395b7389b31dcf6e8290a494f41c29cae178d30ede1db3324a3032340b63bb060af678c0d85d2a4dd6d276bcc92ad1eb945d08f09e31693625c'
            '975a4632c8d9e6c363076c7edce12c08b7819f8cbecd3a2f9e4f5870650c6d89e7614ae5dc21b3282728820a0b2f7e020654d5113dc4e3e2630c80e4d3eda0f1'
            '81ed74b203ff80c8fcc33a9574374905bbdc82dfdb3c248f4502c34027bb916d7b9b100ff96eea9bad0218e8e070a88ab4abce3fb11406e476fefb5753e5a3a8'
            'b8596f68fc8e483614b945add56ab7177a4139d6cc71790d180bee13ab9dcd9e1f856b4ae4b89020290f9534d9fab87e4cca29deefad4eff9a6cb497b3a4696b'
            '80d346b40efab0351cba6b794cf959ab98268c2a0814fe2714d6536c8cc06c4790fdb4745976cd6be3c54d420f520c60776c3e5859c4e469d9182138e0436dba')
