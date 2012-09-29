# Maintainer: Xaseron <xaseron@googlemail.com>
# gracefully copied from virtuemood

pkgname=xen-4.2-testing-hg
pkgver=20120925
pkgrel=1
pkgdesc="Xen hg 4.2 unstable (hypervisor tools and doc)"
arch=(i686 x86_64)
url="http://xen.org/"
license="GPL"
depends=('xz' 'yajl' 'bzip2' 'lib32-glibc' 'transfig' 'texlive-core' 'iproute' 'bridge-utils' 'python2' 'sdl' 'zlib' 'e2fsprogs' 'bin86' 'pkgconfig' 'iasl' 'gnutls')
makedepends=('dev86' 'mercurial' 'git' 'ghostscript')
conflicts=('xen' 'xen3' 'xen4' 'xen-hv-tools' 'libxen4')
provides=('xen')

build() {

  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d xen-4.2-testing.hg ] ; then
	cd xen-4.2-testing.hg
	hg pull
	msg "The local files are updated."
  else
	hg clone http://xenbits.xen.org/hg/xen-4.2-testing.hg
	cd xen-4.2-testing.hg
  fi

  msg "Starting make..."


  sed -i ./tools/firmware/etherboot/Makefile -e 's/-C \$D\/src bin\/\$/NO_WERROR=1 \-C \$D\/src bin\/\$/g'

  export COMPILER_PATH=/usr/bin
  unset CFLAGS LDFLAGS

  PYTHON=/usr/bin/python2 ./configure --prefix=/usr

  make PYTHON=python2 DESTDIR=$pkgdir install-xen
  make PYTHON=python2 DESTDIR=$pkgdir install-tools
  make -j1 PYTHON=python2 DESTDIR=$pkgdir install-stubdom

  sed -i 's#XENDOM_CONFIG=/etc/sysconfig/xendomains#XENDOM_CONFIG=/etc/conf.d/xendomains#' $pkgdir/etc/init.d/xendomains
  sed -i "s#touch /var/lock/subsys/xend#mkdir -p /var/lock/subsys\n     touch /var/lock/subsys/xend#" $pkgdir/etc/init.d/xend

  [ -d $pkgdir/usr/lib64 ] && ( cd $pkgdir/usr && cp -R lib64/* lib/ && rm -R lib64 )
  ( cd $pkgdir/etc && mv init.d rc.d ) || return 1
  rm -f $pkgdir/usr/share/man/man1/qemu-img.1* \
       $pkgdir/usr/share/man/man1/qemu.1*
  # First experiment to generate grub2.cfg entry
  mkdir -p $pkgdir/etc/grub.d

  ############ kill unwanted stuff ############

# stubdom: newlib
rm -rf $pkgdir/usr/*-xen-elf

# hypervisor symlinks
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

for file in bios.bin openbios-sparc32 openbios-sparc64 ppc_rom.bin palcode-clipper \
         pxe-e1000.bin pxe-ne2k_pci.bin pxe-pcnet.bin pxe-rtl8139.bin \
         vgabios.bin vgabios-cirrus.bin video.x openbios-ppc bamboo.dtb
do
        rm -f $pkgdir/usr/share/qemu-xen/$file
        rm -f $pkgdir/usr/share/xen/qemu/$file
done

# adhere to Static Library Packaging Guidelines
rm -rf $pkgdir/usr/lib/*.a

}
