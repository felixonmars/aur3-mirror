# Contributor: Daniel Golle <daniel.golle@gmail.com>
# AUR Category: emulators

# original PKGBUILD by Bernhard Walle <bernhard.walle@gmx.de>
# patches taken from OpenSuSE kvm-84 package

pkgname=kvm-opensuse
pkgver=84
pkgrel=1
pkgdesc="KVM Userspace Package"
arch=(i686 x86_64)
url="http://kvm.qumranet.com"
license=('GPL')
groups=()
depends=()
makedepends=( dev86 iasl )
provides=( qemu kvm )
conflicts=( kvm kvm-git qemu )
replaces=()
backup=()
options=()
install=('kvm-opensuse.install')
source=('http://dl.sourceforge.net/sourceforge/kvm/kvm-84.tar.gz'
	'http://ovh.dl.sourceforge.net/sourceforge/kvm/NETKVM-20081229.iso'
	'kvm-opensuse.install'
        '65-kvm.rules'
        'kvm-fix-with-evdev.patch'
	'qemu-datadir.diff'
	'kvm-qemu-default-memsize.patch'
	'kvm-qemu-no-fallback-if-open-kvm-fails.patch'
	'kvm-qemu-lpc.patch'
	'kvm-qemu-applesmc.patch'
	'kvm-qemu-ide-ich6.patch'
	'kvm-qemu-macmodel.patch'
	'kvm-qemu-rtl8139-link.patch'
	'kvm-qemu-multiboot.patch'
	'kvm-kernel-cpuid4.patch'
	'kvm-kernel-msr.patch'
	'kvm-maccpuid.patch'
	'kvm-ioapic.patch'
	'kvm-bios.patch'
	'kvm-preXX-init-on-demand.patch'
	'kvm-preXX-altgr-and-dead-keys-with-VNC.patch' )
	
	

noextract=()
md5sums=( 'a3bf65b31e70b7f214b8de4e39f8adee'
          '39b7206ef400845800f081a5b901f757' )

build() {
  cd "${srcdir}/kvm-${pkgver}"
#  patch -p1 -i $startdir/qemu-datadir.diff
  patch -p1 -i $startdir/kvm-qemu-default-memsize.patch
  patch -p1 -i $startdir/kvm-qemu-no-fallback-if-open-kvm-fails.patch
  # Mac OS X patches
  cp -vr bios bios-mac
  patch -p1 -i $startdir/kvm-qemu-lpc.patch
  patch -p1 -i $startdir/kvm-qemu-applesmc.patch
  patch -p1 -i $startdir/kvm-qemu-ide-ich6.patch
  patch -p1 -i $startdir/kvm-qemu-macmodel.patch
  patch -p1 -i $startdir/kvm-qemu-rtl8139-link.patch
  patch -p1 -i $startdir/kvm-qemu-multiboot.patch
  patch -p1 -i $startdir/kvm-kernel-cpuid4.patch
  patch -p1 -i $startdir/kvm-kernel-msr.patch
  patch -p1 -i $startdir/kvm-maccpuid.patch
  patch -p1 -i $startdir/kvm-ioapic.patch
  patch -p1 -i $startdir/kvm-bios.patch
  # Post-release upstream patches
  patch -p1 -i $startdir/kvm-preXX-init-on-demand.patch
  patch -p1 -i $startdir/kvm-preXX-altgr-and-dead-keys-with-VNC.patch
  # for IA64
  #patch -p1 -i $startdir/ia64-fix-pagesize.pl
  #patch -p1 -i $startdir/IA64-kvm-suse.patch
  # archlinux supplied patch
  patch -p1 -i $startdir/kvm-fix-with-evdev.patch

  #
  # BUILD HERE
  #

  ./configure --prefix=/usr --audio-drv-list=oss,alsa,pa --with-patched-kernel --audio-card-list="ac97 adlib cs4231a gus" \

  make || return 1
  make -C bios-mac || return 1
  make DESTDIR="${pkgdir}/" install
  cp bios-mac/BIOS-bochs-latest "${pkgdir}/usr/share/qemu/bios-mac.bin"
  cp ${srcdir}/NETKVM-20081229.iso "${pkgdir}/usr/share/qemu/"
  rm -fr $pkgdir/usr/include/linux/

  #
  # COPY FILES
  #
  mkdir -p $pkgdir/etc/udev/rules.d
  cp $startdir/65-kvm.rules $pkgdir/etc/udev/rules.d
}
