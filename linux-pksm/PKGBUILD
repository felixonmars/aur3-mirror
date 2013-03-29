# Maintainer: Figo.zhang <figo1802@gmail.com>

pkgname=linux-pksm
true && pkgname=(linux-pksm linux-pksm-headers)
_kernelname=-pksm
_srcname=linux-3.6
pkgver=3.6.0
pkgrel=10
arch=('i686' 'x86_64')
url="https://code.google.com/p/pksm/"
license=('GPL2')
options=('!strip')
_ckpatchversion=1
_ckpatchname="patch-3.6-ck${_ckpatchversion}"
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.6.0-v5"
_pksmvernel="0.1"
_pksmname="v3.6.0"
source=(
        "http://www.kernel.org/pub/linux/kernel/v3.x/${_srcname}.tar.bz2"
         'pksm-v0.1-for-linux3.6.0.patch'
        'linux-pksm.preset'
        'change-default-console-loglevel.patch'
        "config"
        "config.x86_64"
        )
        
sha256sums=(
            '88ae0a20fd39ecae79db0ce8f9397922fae33c8b06a54ed2c883c861126c9771'      
            'ecacd9dd7ec8fa254924e5d8472839d9397b06396a592521b7fee728a6d2c1c1'
            '1ab917df106238ff9c57b88746c0fea5d536413f598fc1e3a91cb42406dc6836'

            'b9d79ca33b0b51ff4f6976b7cd6dbb0b624ebf4fbf440222217f8ffc50445de4'
            'a7fb7c847ccc5339c1b908cced0c530914e68926d6e47cb2ebad1d9fc10d7cf4'
            'f5d959ad9d7efd6d032a69866ddcbe8fee59a2f8038489e9d74db05d608a25a5'
            )
            
build() {
	cd "${srcdir}/${_srcname}"

	### Patch source with PKSM
	msg "Patching with PKSM"
	patch -Np1 -i "${srcdir}/pksm-v0.1-for-linux3.6.0.patch"

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
  if [ $_use_current = "y" ]; then
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

#  ### BFQ to be compiled in but not enabled
#  sed -i -e s'/CONFIG_CFQ_GROUP_IOSCHED=y/CONFIG_CFQ_GROUP_IOSCHED=y\nCONFIG_IOSCHED_BFQ=y\nCONFIG_CGROUP_BFQIO=y/' \
#  -i -e s'/CONFIG_DEFAULT_CFQ=y/CONFIG_DEFAULT_CFQ=y\n# CONFIG_DEFAULT_BFQ is not set/' ./.config

#  ### Optionally enable BFQ as the default io scheduler
#  if [ $_BFQ_enable_ = "y" ]; then
#  sed -i -e '/CONFIG_DEFAULT_IOSCHED/ s,cfq,bfq,' \
#  -i -e s'/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set\nCONFIG_DEFAULT_BFQ=y/' ./.config
#  fi

 # set extraversion to pkgrel
 sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

 # don't run depmod on 'make install'. We'll do this ourselves in packaging
 sed -i '2iexit 0' scripts/depmod.sh

# get kernel version
 msg "Running make prepare for you to enable patched options of your choosing"
 make prepare

 ### Optionally load needed modules for the make localmodconfig
 # See http://aur.archlinux.org/packages.php?ID=41689
 if [ $_localmodcfg = "y" ]; then
 msg "If you have modprobe_db installed, running it in recall mode now"
 if [ -e /usr/bin/modprobed_db ]; then
 [[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo. Install via pacman -S sudo and configure to work with this user." && exit 1
 sudo /usr/bin/modprobed_db recall
 fi
 msg "Running Steven Rostedt's make localmodconfig now"
 make localmodconfig
 fi

 if [ $_makenconfig = "y" ]; then
 msg "Running make nconfig"
 make nconfig
 fi

 msg "Running make bzImage and modules"
 make ${MAKEFLAGS} LOCALVERSION= bzImage modules -j 4
}

package_linux-pksm() {
_Kpkgdesc='Linux Kernel and modules with the PKSM patchset'
pkgdesc="${_Kpkgdesc}"
depends=('coreutils' 'linux-firmware' 'mkinitcpio>=0.7')
optdepends=('crda' 'nvidia-ck' 'nvidia-beta-ck' 'modprobed_db' 'nvidia-pksm')
provides=("linux-pksm=${pkgver}")
conflicts=('kernel26-ck')
replaces=('kernel26-ck')
backup=("etc/mkinitcpio.d/linux-pksm.preset")
install=linux-pksm.install
#groups=('ck-generic')

cd "${srcdir}/${_srcname}"

KARCH=x86

# get kernel version
_kernver="$(make LOCALVERSION= kernelrelease)"
_basekernel=${_kernver%%-*}
_basekernel=${_basekernel%.*}

mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-pksm"

# add vmlinux
install -D -m644 vmlinux "${pkgdir}/usr/src/linux-${_kernver}/vmlinux"

# install fallback mkinitcpio.conf file and preset file for kernel
install -D -m644 "${srcdir}/linux-pksm.preset" "${pkgdir}/etc/mkinitcpio.d/linux-pksm.preset"

# set correct depmod command for install
sed \
 -e "s/KERNEL_NAME=.*/KERNEL_NAME=-pksm/g" \
 -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
 -i "${startdir}/linux-pksm.install"
sed \
 -e "1s|'linux.*'|'linux-pksm'|" \
 -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-linux-pksm\"|" \
 -e "s|default_image=.*|default_image=\"/boot/initramfs-linux-pksm.img\"|" \
 -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-linux-pksm-fallback.img\"|" \
 -i "${pkgdir}/etc/mkinitcpio.d/linux-pksm.preset"

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

package_linux-pksm-headers() {
_Hpkgdesc='Header files and scripts to build modules for linux-pksm.'
pkgdesc="${_Hpkgdesc}"
provides=("linux-pksm-headers=${pkgver}" "linux-headers=${pkgver}")
conflicts=('kernel26-pksm-headers')
replaces=('kernel26-pksm-headers')
#groups=('ck-generic')

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

for i in acpi asm-generic config crypto drm generated linux math-emu \
 media net pcmcia scsi sound trace video xen; do
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
mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video"

cp drivers/media/video/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/"

for i in bt8xx cpia2 cx25840 cx88 em28xx pwc saa7134 sn9c102; do
mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/${i}"
cp -a drivers/media/video/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/video/${i}"
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
mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core"
cp drivers/media/dvb/dvb-core/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-core/"
# and...
# http://bugs.archlinux.org/task/11194
mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/"
[[ -e include/config/dvb/ ]] && cp include/config/dvb/*.h "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/"

# add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
# in reference to:
# http://bugs.archlinux.org/task/13146
mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/"
cp drivers/media/dvb/frontends/lgdt330x.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/"
cp drivers/media/video/msp3400-driver.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/"

# add dvb headers
# in reference to:
# http://bugs.archlinux.org/task/20402
mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb"
cp drivers/media/dvb/dvb-usb/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/dvb-usb/"
mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends"
cp drivers/media/dvb/frontends/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb/frontends/"
mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners"
cp drivers/media/common/tuners/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/common/tuners/"

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
find "${pkgdir}/usr/src/linux-${_kernver}/scripts" -type f -perm -uw 2>/dev/null | while read binary ; do
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
rm -rf "${pkgdir}"/usr/src/linux-${_kernver}/arch/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,xtensa}
}

# Global pkgdesc and depends are here so that they will be picked up by AUR
pkgdesc='Linux Kernel and modules with the PKSM patchset'

# vim:set ts=8 sts=2 sw=2 et:
