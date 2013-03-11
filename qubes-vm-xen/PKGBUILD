# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Olivier Medoc <o_medoc@yahoo.fr>
pkgname=qubes-vm-xen
pkgver=4.1.2
pkgqubesrel=24
pkgrel=24
qubescoretag=v2.1.16-dom0
qubesguitag=v2.1.10
epoch=
pkgdesc="Xen is a virtual machine monitor"
arch=("x86_64")
url="http://qubes-os.org/"
license=('GPL')
groups=()
depends=(python2)
makedepends=(wget make gcc patch git bin86 dev86 iasl)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=(xen-$pkgver.tar.gz)
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

verify() {
  version=$1

  TAG=`git tag --points-at=$version | head -n 1`
  echo "Verifying git sources for version $version..."
  git checkout $TAG
  echo "If it fails, your should download Qubes master keys, verify the fingerprint and trust it"
  echo "gpg --recv-keys 0x36879494"
  echo "gpg --list-keys --fingerprint (fingerprint can be found on http://qubes-os.org/trac/wiki/VerifyingSignatures"
  echo "gpg --edit-key 0x36879494 then trust, 5, y, q"
  echo "wget http://keys.qubes-os.org/keys/qubes-developers-keys.asc"
  echo "gpg --import qubes-developers-keys.asc"
  git tag -v $TAG
}

build() {
  git clone git://git.qubes-os.org/marmarek/xen
  git clone git://git.qubes-os.org/marmarek/core
  git clone git://git.qubes-os.org/marmarek/gui

  cd core
  verify $qubescoretag

  cd ../gui
  verify $qubesguitag

  cd ../xen
  verify v$pkgver-$pkgqubesrel

  #echo "Patching source..."
  #sed 's://download.savannah.gnu.org/releases/lwip/older_versions/://mirrors.fe.up.pt/pub/nongnu/lwip/older_versions/:' -i Makefile

  echo "Get Sources..."
  make get-sources

  echo "Verify Sources..."
  make verify-sources

  echo "Untar and patch"
  tar xzvf xen-$pkgver.tar.gz
  cd xen-$pkgver
  patch -p1 < ../$Patch1
  patch -p1 < ../$Patch4
  patch -p1 < ../$Patch5

  patch -p1 < ../$Patch10

  patch -p1 < ../$Patch18
  patch -p1 < ../$Patch20
  patch -p1 < ../$Patch26
  patch -p1 < ../$Patch28
  patch -p1 < ../$Patch29
  patch -p1 < ../$Patch30
  patch -p1 < ../$Patch31

  patch -p1 < ../$Patch100
  patch -p1 < ../$Patch101
  patch -p1 < ../$Patch102
  patch -p1 < ../$Patch103
  patch -p1 < ../$Patch104

  patch -p1 < ../$Patch105
  patch -p1 < ../$Patch106
  patch -p1 < ../$Patch108
  patch -p1 < ../$Patch110
  patch -p1 < ../$Patch111
  patch -p1 < ../$Patch112
  patch -p1 < ../$Patch113
  patch -p1 < ../$Patch114
  patch -p1 < ../$Patch115
  patch -p1 < ../$Patch117
  patch -p1 < ../$Patch120
  patch -p1 < ../$Patch121
  patch -p1 < ../$Patch122
  patch -p1 < ../$Patch123
  patch -p1 < ../$Patch124
  patch -p1 < ../$Patch125
  patch -p1 < ../$Patch126
  patch -p1 < ../$Patch127
  patch -p1 < ../$Patch128

  patch -p1 < ../$Patch666
  patch -p1 < ../$Patch667
  patch -p1 < ../$Patch668
  patch -p1 < ../$Patch669
  patch -p1 < ../$Patch670
  patch -p1 < ../$Patch671
  patch -d tools/ioemu-qemu-xen -p1 < ../$Patch672
  patch -p1 < ../$Patch673
  patch -p1 < ../$Patch675
  patch -p1 < ../$Patch676
  patch -p1 < ../$Patch677
  patch -p1 < ../$Patch678
  patch -p1 < ../$Patch679
  patch -p1 < ../$Patch680
  patch -p1 < ../$Patch681
  patch -p1 < ../$Patch682
  patch -p1 < ../$Patch683
  patch -p1 < ../$Patch684
  patch -p1 < ../$Patch685
  patch -p1 < ../$Patch686
  patch -p1 < ../$Patch688

  patch -p0 < ../$Patch200
  patch -p2 < ../$Patch201
  patch -p1 < ../$Patch202
  patch -p2 < ../$Patch203
  patch -p1 < ../$Patch204
  patch -p1 < ../$Patch205

  # Fix for glibc 2.7
  sed 's:LIBS+=-lutil:LIBS+=-lutil -lrt:' -i tools/ioemu-qemu-xen/Makefile.target

  # stubdom sources
  cp -v ../$Source10 ../$Source11 ../$Source12 ../$Source13 ../$Source14 ../$Source16 stubdom
  cp -v ../$Patch23 stubdom/grub.patches/99grub-ext4-support.patch
  cp -v ../$Source15 tools/firmware/etherboot/ipxe.tar.gz
  cp -v ../$Source17 tools/vnet/
  cp -v ../$Source18 tools/vtpm/

  # qubes specific parts of stubdom
  mkdir -p tools/qubes-gui/
  cp -a ../../$Source33/* tools/qubes-gui
  make -C tools/qubes-gui clean
  cp -a ../../$Source34/vchan tools/
  make -C tools/vchan -f Makefile.stubdom clean
  patch -p1 < tools/qubes-gui/gui-agent-qemu/qemu-glue.patch

  cp -a ../$Source35/* tools/ioemu-qemu-xen/
  patch -d tools/ioemu-qemu-xen -p4 < ../$Source35/lwip-dhcp-qemu-glue.patch

  mkdir -p tboot
  cp -v ../$Source19 tboot/
 
  export XEN_VENDORVERSION="-$pkgrel"
  export CFLAGS="$RPM_OPT_FLAGS"
  export OCAML_TOOLS=n
  export PYTHON=python2
  unset LDFLAGS

  make prefix=/usr dist-xen
  make prefix=/usr dist-tools
  make prefix=/usr dist-docs
  unset CFLAGS
  make dist-stubdom

}

package() {
  cd xen/xen-$pkgver

  export OCAML_TOOLS=n
  export PYTHON=python2
  make DESTDIR=$pkgdir LIBDIR=/usr/lib/ prefix=/usr install-tools

  # Remove unwated stuff
  rm -rf $pkgdir/boot/
  rm -rf $pkgdir/usr/share/doc/xen
  rm -rf $pkgdir/usr/share/doc/qemu
  rm -f $pkgdir/usr/sbin/xen-python-path

  rm -rf $pkgdir/usr/share/xen/man
  rm -rf $pkgdir/usr/bin/qemu-*-xen

  # Remove /var/lock (it is tmpfs in archlinux anyway)
  rm -rf $pkgdir/var/lock

  #rm -rf $pkgdir/usr/share/xen/qemu/*
  for file in bios.bin openbios-sparc32 openbios-sparc64 ppc_rom.bin \
           pxe-e1000.bin pxe-ne2k_pci.bin pxe-pcnet.bin pxe-rtl8139.bin \
           vgabios.bin vgabios-cirrus.bin video.x openbios-ppc bamboo.dtb
  do
     rm -rf $pkgdir/usr/share/xen/qemu/$file
  done

  # Install sysconfig files
  # modules
  # logrotate
  # init scripts

}

# vim:set ts=2 sw=2 et:


# XEN PATCHES

Patch1=xen-initscript.patch
Patch4=xen-dumpdir.patch
Patch5=xen-net-disable-iptables-on-bridge.patch

Patch10=xen-no-werror.patch

Patch18=localgcc45fix.patch
Patch20=localgcc451fix.patch
Patch23=grub-ext4-support.patch
Patch26=localgcc46fix.patch
Patch28=pygrubfix.patch
Patch29=xen-4.1.2-compile-fixes.patch
Patch30=gdbsx-glibc2.17.patch
Patch31=xen-shared-loop-losetup.patch

Patch100=xen-configure-xend.patch
Patch101=xen-no-downloads.patch
Patch102=xen-acpi-override-query.patch
Patch103=xen-dont-install-outdated-latex-documentation.patch
Patch104=xen-tools-canonicalize-python-location.patch

# libxl fixes
# 102-109,112-113,117 are candidates to be included in upstream release
Patch105=xen-xl-networkattach-memory-allocation.patch
Patch106=xen-libxl-python-missing-pyincref.patch
Patch108=xen-libxl-devid-to-nic-domid.patch
Patch110=xen-libxl-script-block-backend.patch
Patch111=xen-hotplug-external-store.patch
Patch112=xen-libxl-add-all-pci-at-once.patch
Patch113=xen-libxl-pci-detach-fix.patch
Patch114=xen-libxl-pci-list-segv-fix.patch
Patch115=xen-libxl-backend-xenstore-perms.patch
Patch117=xen-libxl-networkattach-empty-vif-dir.patch
Patch120=xen-libxl-block-attach-fix-non-dom0-backend.patch
Patch121=xen-libxl-daemon-pid-stderr.patch
Patch122=xl-disk-backend-domid.patch
Patch123=stubdom-vbd-non-dom0-backend.patch
Patch124=xl-block-parse-cdrom.patch
Patch125=xen-libxl-error-write-perm.patch
Patch126=xen-xl-create-quiet.patch
Patch127=libxl-create-dm-uninitialized-variable.patch
Patch128=libxc-bzimageloader-lower-loglevel.patch

Patch666=xen-nergal-sysret-attack.patch
Patch667=xsa11-4.1.patch
Patch668=xsa12-all.patch
Patch669=xsa13-xen-4.1.patch
Patch670=xsa14-xen-3.4-and-4.x.patch
Patch671=xsa16-xen-4.1.patch
Patch672=xsa17-qemu-xen-traditional-all.patch
Patch673=xsa10-4.1.patch
# XSA 18 do not affect Xen 4.1
# XSA 19 not applicable to Qubes
Patch675=xsa20.patch
Patch676=xsa21.patch
Patch677=xsa22-4.1.patch
Patch678=xsa23-4.0-4.1.patch
Patch679=xsa24.patch
Patch680=xsa25-4.1.patch
Patch681=xsa26-4.1.patch
Patch682=xsa27-4.1.patch
Patch683=xsa28-4.1.patch
Patch684=xsa29-4.1.patch
Patch685=xsa30-4.1.patch
Patch686=xsa31-4.1.patch
# XSA 32 do not affect Xen 4.1
Patch688=xsa33-4.1.patch

# Qubes HVM
Patch200=xen-stubdom-qubes-gui.patch
Patch201=xen-libxl-qubes-minimal-stubdom.patch
Patch202=xen-disable-dom0-qemu.patch
Patch203=stubdom-lwip-fix-for-dhcp.patch
Patch204=xen-libxl-stubdom-pci-create.patch
Patch205=xen-libxl-timeoffset-localtime.patch

# XEN SOURCES
Source0=xen-%{version}.tar.gz
Source1=%{name}.modules
Source2=%{name}.logrotate
# used by stubdoms
Source10=lwip-1.3.0.tar.gz
Source11=newlib-1.16.0.tar.gz
Source12=zlib-1.2.3.tar.gz
Source13=pciutils-2.2.9.tar.bz2
Source14=grub-0.97.tar.gz
Source15=ipxe-git-v1.0.0.tar.gz
Source16=ocaml-3.11.0.tar.gz
Source17=gc.tar.gz
Source18=tpm_emulator-0.5.1.tar.gz
Source19=tboot-20090330.tar.gz
# init.d bits
Source20=init.xenstored
Source21=init.xenconsoled
Source22=init.blktapctrl
Source23=init.xend
# sysconfig bits
Source30=sysconfig.xenstored
Source31=sysconfig.xenconsoled
Source32=sysconfig.blktapctrl

# Qubes components for stubdom
Source33=gui
Source34=core
Source35=stubdom-dhcp



md5sums=('e53a49c9049410c9ccaa4e86d5b9452e')
