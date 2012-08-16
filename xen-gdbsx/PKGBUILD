pkgname=xen-gdbsx
pkgver=4.1.3
pkgrel=1
pkgdesc='Xen 4 (hypervisor and tools) with gdbsx support'
arch=('i686' 'x86_64')
url="http://xen.org/"
license="GPL"

depends=('xz' 'bzip2' 'iproute' 'bridge-utils' 'python2' 'sdl' 'zlib' 'e2fsprogs' 'bin86' 'pkgconfig' 'gnutls' 'lzo2' 'glibc')
[ "$CARCH" == "x86_64" ] && depends=(${depends} 'lib32-glibc')
optdepends=('xen-docs: Xen Official Documentation')
makedepends=('dev86' 'ocaml-findlib' 'iasl')
conflicts=('xen' 'xen4' 'xen3' 'xen-hv-tools' 'libxen4')
provides=('xen')
backup=('etc/xen/xend-config.sxp' 'etc/xen/xend-pci-permissive.sxp' 'etc/xen/xend-pci-quirks.sxp')
options=(!strip)
optional=(xen-docs)

source=("http://bits.xensource.com/oss-xen/release/${pkgver}/xen-${pkgver}.tar.gz"
	'09_xen'
	'xen.patch'
	'archinit.patch'
        'dom0_xz_decompression.patch')

md5sums=('bed929d5c5e5135cab40e2a6aab73fa0'
         '1eb1de5675e4499018a37c3a5de973fe'
         'dcb0a190a97f2eb9008d12b83c8e7d83'
         '70d51d1355a9596b0209381ba16b5d7a'
         '696f345bc0a537fb50f699bff30839ad')

build() {
  cd $srcdir/xen-${pkgver}

  patch -p1 -i ../xen.patch
  patch -p1 -i ../archinit.patch
  patch -p1 -i ../dom0_xz_decompression.patch

  unset CFLAGS LDFLAGS

  make PYTHON=python2 DESTDIR=$pkgdir gdbsx=y install-xen
  make PYTHON=python2 DESTDIR=$pkgdir gdbsx=y install-tools
  #make PYTHON=python2 DESTDIR=$pkgdir gdbsx=y install-stubdom

  sed -i 's#XENDOM_CONFIG=/etc/sysconfig/xendomains#XENDOM_CONFIG=/etc/conf.d/xendomains#' $pkgdir/etc/init.d/xendomains
  sed -i "s#touch /var/lock/subsys/xend#mkdir -p /var/lock/subsys\n	touch /var/lock/subsys/xend#" $pkgdir/etc/init.d/xend

  [ -d $pkgdir/usr/lib64 ] && ( cd $pkgdir/usr && cp -R lib64/* lib/ && rm -R lib64 )
  ( cd $pkgdir/etc && mv init.d rc.d ) || return 1
  rm -f $pkgdir/usr/share/man/man1/qemu-img.1* \
    $pkgdir/usr/share/man/man1/qemu.1*
  # First experiment to generate grub2.cfg entry
  mkdir -p $pkgdir/etc/grub.d
  chmod +x $srcdir/09_xen
  cp $srcdir/09_xen  $pkgdir/etc/grub.d

  ############ kill unwanted stuff ############

  # stubdom: newlib
  rm -rf $pkgdir/usr/*-xen-elf

  # hypervisor symlinks
  rm -rf $pkgdir/boot/xen-4.1.gz
  rm -rf $pkgdir/boot/xen-4.gz
  rm -rf $pkgdir/boot/xen.gz

  # silly doc dir fun
  rm -fr $pkgdir/usr/share/doc/xen
  rm -rf $pkgdir/usr/share/doc/qemu

  # Pointless helper
  rm -f $pkgdir/usr/sbin/xen-python-path

  # qemu stuff (unused or available from upstream)
  rm -rf $pkgdir/usr/share/xen/man
  rm -rf $pkgdir/usr/bin/qemu-*-xen
  for file in bios.bin openbios-sparc32 openbios-sparc64 ppc_rom.bin \
              pxe-e1000.bin pxe-ne2k_pci.bin pxe-pcnet.bin pxe-rtl8139.bin \
              vgabios.bin vgabios-cirrus.bin video.x openbios-ppc bamboo.dtb
  do
    rm -f $pkgdir/usr/share/xen/qemu/$file
  done

  # adhere to Static Library Packaging Guidelines
  rm -rf $pkgdir/usr/lib/*.a
}
