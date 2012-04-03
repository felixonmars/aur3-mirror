# Contributor: Karolina Lindqvist <karolina.lindqvist@kramnet.se>

pkgname=pic30-binutils
pkgver=3.31
pkgrel=2
pkgdesc="PIC24/dsPIC3/dsPIC33 binutils"
arch=(i686)
url="http://www.microchip.com"
license=('GPL')

# Tunable variables
# Smartio level. This should be the same as in pic30-gcc (I think)
c30_smartio_rules=2
# searches pic30path first then mch_pic30path for compatibility
# this assumes mplabx is installed, 
# otherwise another path to wherever the support files for asm30 are
pic30path="/usr/share/pic30"
mch_pic30path="/opt/microchip/mplabx/asm30"
# default object format for the plain pic30-as, pic30-ld etc. commands
defobf=elf

makedepends=(hd2u bison)
source=(http://ww1.microchip.com/downloads/en/DeviceDoc/mplabalc30v${pkgver/./_}.tar.gz
    morediffs.patch notestsuite.patch resource.patch default-path.patch relocation-fix.patch
    sbrk.patch c30_resource-paths.patch cpu-pic30.c.patch)


build() {
  cd $srcdir/acme

  # Change DOS to UNIX
  find . -type f -exec dos2unix -U "{}" ';'
  find ../c30_resource/src/c30/ -type f -exec dos2unix -U "{}" ';'
  find ../c30_resource/src/generator/ -type f -exec dos2unix -U "{}" ';'
  # patches, all the patches
  patch -b -p0 < ../resource.patch
#  patch -b -p0 < ../default-path.patch
#  patch -b -p0 < ../relocation-fix.patch
  patch -b -p0 < ../notestsuite.patch
  patch -b -p0 < ../morediffs.patch
  patch -b -p0 < ../sbrk.patch
  patch -b -p0 < ../../c30_resource-paths.patch
  patch -b -p0 < ../../cpu-pic30.c.patch

  # There is a problem with finding the resource file
  # Here we add some alternatives locations. 
  # Only those places will be searched before giving up
  echo "char *pic30_resource_files[] = {"				 	>c30_device_info_path.h
  echo "\"/usr/share/pic30/c30_device.info\"," 			         	>>c30_device_info_path.h
  for f in $(find /opt/microchip -name c30_device.info); do echo "\"$f\","; done >>c30_device_info_path.h
  echo "0};" 									>>c30_device_info_path.h

  echo "#define MCHP_VERSION v$pkgver for Arch Linux" >mchp_version.h
  # Force regeneration of lexer and parser
  touch $srcdir/acme/ld/{ldlex.l,ldgram.y}
  CFLAGS="-g -DPIC30MAGIC -DPIC30 -DC30_SMARTIO_RULES=$c30_smartio_rules -DPIC30PATH=\"$pic30path\" -DMCH_PIC30PATH=\"$mch_pic30path\"" \
      ./configure --target=pic30-coff \
      --program-prefix=pic30-coff- \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --enable-debug
  make
  make DESTDIR="$pkgdir/" install

  # Another go around to create elf version
  cd $srcdir/acme
  make clean
  CFLAGS="-g -DPIC30MAGIC -DPIC30 -DPIC30ELF -DC30_SMARTIO_RULES=$c30_smartio_rules -DPIC30PATH=\"$pic30path\" -DMCH_PIC30PATH=\"$mch_pic30path\"" \
      ./configure --target=pic30-elf \
      --program-prefix=pic30-elf- \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --enable-debug
  make
  make DESTDIR="$pkgdir/" install-binutils install-gas install-ld


# Despite trying hard I can't get the files to end up in the right places,
# and with the right names, so here they are moved around

  install -d $pkgdir/usr/lib/ldscripts
  mv -v $pkgdir/usr/pic30-{coff,elf}/lib/ldscripts/* $pkgdir/usr/lib/ldscripts
  rm -fr $pkgdir/usr/pic30-{coff,elf}

  # remove info dir
  rm -fr $pkgdir/usr/info
#  cd $pkgdir/usr/share/info
#  rm configure* standards*
#  for f in *info*; do \
#      mv $f $pkgdir/usr/share/info/pic30-$f; \
#  done
#  rm $pkgdir/usr/share/info/dir

  rm $pkgdir/usr/lib/libiberty.a
  # fix man-page names
  for f in $pkgdir/usr/share/man/man1/*-$defobf-*; do \
      mv $f ${f/pic30-$defobf-/pic30-}; \
  done
  rm -f $pkgdir/usr/share/man/man1/*-{coff,elf}-*

  # Set default obf
  for f in $pkgdir/usr/bin/*-$defobf-*; do \
      ln $f ${f/-$defobf-/-}; \
  done
}

md5sums=('bb1b66307133ffa7fdf06fa603bd4e6d'
         'b61740852285e366cba6f0121d18f3bd'
         'd32447bb996aa2e83895ff777e1d60fe'
         '81e80e105f1b8d3fface527bafd8fe7b'
         '38ba95194e69871d8fbbdaa24ee89f7b'
         'bcbf5d2fbe685b50001538a06270fd77'
         '527681b2f26485c84d3738741c669174'
         '6a8d9c01a982ba5d1c0f2df9f45d61bb'
         '3bf618ad7fa3124db6fdc3893b698321')
