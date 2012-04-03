# Maintainer: Karolina Lindqvist <karolina.lindqvist@kramnet.se>

pkgname=pic30-gcc
pkgver=3.31
pkgrel=2
pkgdesc="PIC24/dsPIC30 gcc"
arch=(i686)

# Tunable variables.
# Default object format, coff or elf.  See below for building both formats
defobf=elf
# Default smartio_rules, the value can be 0, 1 or 2
# The value has to be supported by the C library and be the same as in pic30_binutils
c30_smartio_rules=2
# searches pic30path first then mch_pic30path for mplabx compatibility
pic30path="/usr/share/pic30"
mch_pic30path="/opt/microchip/mplabc30/v3.30c"

url="http://www.microchip.com"
depends=("pic30-binutils>=$pkgver")
makedepends=(hd2u "autoconf>=2.13")
license=('GPL')
source=(http://ww1.microchip.com/downloads/en/DeviceDoc/mplabc30v${pkgver/./_}.tar.gz
        notestsuite.patch t-pic30.patch
	pic30-standard-prefix.patch resource.patch
	version.patch docs.patch c30_flag_definitions.h.patch
	configure.patch 
	program-prefix-fix.patch make-relative-prefix.c.patch remove-omf.patch gcc.c.patch
	bugfix.patch pic30.c.patch default-include-path.patch disable-fixinc.patch resource.c.patch)

build() {
  cd $srcdir/gcc-4.0.2/gcc-4.0.2/
  # Convert from DOS
  find . -type f -exec dos2unix -U "{}" ';' 
  find $srcdir/c30_resource/src/c30/ -type f -exec dos2unix -U "{}" ';' 
  find $srcdir/c30_resource/src/generator/ -type f -exec dos2unix -U "{}" ';' 
  find . -type f -exec dos2unix -U "{}" ';' 

  # Apply all the patches and hacks
  # The commented out patches are retired
  patch -p0 -b < ../../pic30-standard-prefix.patch 
  patch -p0 -b < ../../t-pic30.patch 
  patch -p0 -b < ../../notestsuite.patch 
  patch -p0 -b < ../../program-prefix-fix.patch 
#  patch -p0 -b < ../../patches.patch 
  patch -p0 -b < ../../docs.patch 
  patch -b -p0 < ../../version.patch 
#  patch -b -p0 < ../../cpp-defaults.patch 
  patch -b -p0 < ../../configure.patch 
#  patch -b -p0 < ../../defines.h.patch 
#  patch -b -p0 < ../../nolicense.patch 
#  patch -p0 -b < ../../config.gcc.patch 
  patch -b -p0 < ../../resource.patch
  patch -b -p0 < ../../c30_flag_definitions.h.patch
  patch -b -p0 < ../../make-relative-prefix.c.patch
  patch -b -p0 < ../../remove-omf.patch
  patch -b -p0 < ../../gcc.c.patch
#  patch -b -p0 < ../../bugfix.patch
  patch -b -p0 < ../../default-include-path.patch
  patch -b -p0 < ../../pic30.c.patch
  patch -b -p0 < ../../resource.c.patch
  patch -b -p0 < ../../disable-fixinc.patch

  cd $srcdir/gcc-4.0.2/gcc-4.0.2/

  # There is a problem with finding the resource file
  # Here we add some alternatives locations. 
  # Only those places will be searched before giving up
  echo "char *pic30_resource_files[] = {"				 	>c30_device_info_path.h
  echo "\"/usr/share/pic30/c30_device.info\"," 			         	>>c30_device_info_path.h
  for f in $(find /opt/microchip -name c30_device.info); do echo "\"$f\","; done >>c30_device_info_path.h
  echo "0};" 									>>c30_device_info_path.h

  mkdir build
  build_install "elf"

  cd $srcdir/gcc-4.0.2/gcc-4.0.2
  make -C build clean
  find -name 'config.cache' -exec rm {} \;
  build_install "coff"

    rm -fr $pkgdir/usr/share/locale $pkgdir/usr/share/man/man7/gpl.7 $pkgdir/usr/share/man/man7/gfdl.7 $pkgdir/usr/share/man/man7/fsf-funding.7

  # Despite all the above, things do not end up in the right places
  # and with the right names. So we fix it up here
#    for f in cpp gcc gccbug gcov; do \
#	mv $pkgdir/usr/bin/pic30-pic30-$f $pkgdir/usr/bin/pic30-$f; \
#	done
#    for f in cpp gcov gcc; do \
#	mv $pkgdir/usr/share/man/man1/pic30-pic30-$f.1 $pkgdir/usr/share/man/man1/pic30-$f.1; \
#	done
#    install -m 0755 -d $pkgdir$pic30path/include

    install -m 0755 -d $pkgdir$pic30path/include

# don't do this anymore, these include files does not exist
#    for f in float.h  iso646.h  stdarg.h  stdbool.h  stddef.h  varargs.h; do \
#	mv $pkgdir/usr/lib/gcc/pic30-$defobf/4.0.3/install-tools/include/$f $pkgdir$pic30path/include; \
#	done

  # Pick up the gcc limits file before junk was added
    install -m644 $srcdir/gcc-4.0.2/gcc-4.0.2/gcc/glimits.h $pkgdir$pic30path/include/limits.h
    install -m 0755 -d $pkgdir/usr/bin

  # Remove libiberty built for host
#    rm $pkgdir/usr/pic30-{coff,elf}/lib/libiberty.a

  # Remove info-files that are in gcc
    rm $pkgdir/usr/share/info/*

    # Link the default version
    ln -f $pkgdir/usr/bin/pic30-$defobf-gcc-4.0.3 $pkgdir/usr/bin/pic30-gcc-4.0.3
    ln -f $pkgdir/usr/bin/pic30-$defobf-gcc-4.0.3 $pkgdir/usr/bin/pic30-gcc

    rm $pkgdir/usr/bin/pic30-pic30-gcc
    mv $pkgdir/usr/bin/pic30-pic30-gccbug $pkgdir/usr/bin/pic30-gccbug
    mv $pkgdir/usr/bin/pic30-pic30-gcov $pkgdir/usr/bin/pic30-gcov
    mv $pkgdir/usr/bin/pic30-pic30-cpp $pkgdir/usr/bin/pic30-cpp
}

#
# Build one of coff/elf
#
build_install()
{
    cd $srcdir/gcc-4.0.2/gcc-4.0.2
#    autogen Makefile.def
    autoconf
    cd $srcdir/gcc-4.0.2/gcc-4.0.2/build
    echo "#define MCHP_VERSION \"v$pkgver $1 for Arch Linux\"" >../gcc/mchp_version.h

    findCPP="/usr/bin/cpp" CFLAGS="-g -DC30_SMARTIO_RULES=$c30_smartio_rules -DPIC30PATH=\""$pic30path\"" -DMCH_PIC30PATH=\""$mch_pic30path\""" \
	../configure --enable-debug -disable-fixincludes \
	--prefix=/usr \
	--target=pic30-$1 \
	--program-prefix=pic30- \
	--enable-languages=c \
 	--libexecdir=/usr/lib \
	--mandir=/usr/share/man \
	--enable-target-optspace --without-headers \
	--with-as=/usr/bin/pic30-$1-as --with-ld=/usr/bin/pic30-$1-ld \
	--with-pkgversion="v$pkgver for Arch Linux"
  # 	--with-local-prefix=$pic30path
  # alt:
  # 	--infodir=/usr/share/info
  # 	--with-gnu-as --with-gnu-ld
  # --program-prefix=pic30-coff  (this is how microchip does it)
  # 	--with-cross-host=pic30
  #         --libdir=$pic30path/lib
  #   --includedir=$pic30path/include --libdir=$pic30path/lib  \
  # -exec-prefix=/usr/pic30 
  # -bindir=/usr/bin
  # --libdir=/usr/lib ???
  # --with-headers=/usr/pic30/include
  # --program-transform-name='s,pic30-pic30-,pic30-,'
  # --with-headers=$pic30path/include
  # --with-gnu-as --with-as=pic30-as --with-gnu-ld --with-ld=pic30-ld 
  # --with-newlib
  # -with-gcc-version-trigger=../version-trigger
  # --enable-threads 
    sed -i '/^SUBDIRS =/s/libiberty//' Makefile
    PATH="$PATH:/usr/bin/core_perl" make

    make -w DESTDIR="$pkgdir/" install

    # this is what we have at this point
    # $pkgdir/usr/bin/pic30-pic30-cpp
    # $pkgdir/usr/bin/pic30-pic30-gcc
    # $pkgdir/usr/bin/pic30-pic30-gccbug
    # $pkgdir/usr/bin/pic30-elf-gcc-4.0.3
    # $pkgdir/usr/bin/pic30-pic30-gcov

    # This will create
    # $pkgdir/usr/bin/pic30-elf-gcc
    ln $pkgdir/usr/bin/pic30-$1-gcc-4.0.3 $pkgdir/usr/bin/pic30-$1-gcc
    mv $pkgdir/usr/share/man/man1/pic30-pic30-cpp.1 $pkgdir/usr/share/man/man1/pic30-cpp.1
    mv $pkgdir/usr/share/man/man1/pic30-pic30-gcov.1 $pkgdir/usr/share/man/man1/pic30-gcov.1
    mv $pkgdir/usr/share/man/man1/pic30-pic30-gcc.1 $pkgdir/usr/share/man/man1/pic30-gcc.1

    #
    # Remove libiberty and some other stuff
    rm $pkgdir/usr/lib/libiberty.a || true
    rm -fr $pkgdir/usr/{pic30-coff,pic30-elf} || true
    rm -fr $pkgdir/usr/lib/gcc/pic30-{elf,coff}/4.0.3/install-tools || true
}
md5sums=('edf7f16644e5164baef5dd3b106c3156'
         'b7782e217ea33b0c4145d84d55dcf5f1'
         '377a7e38cd3db8800a9edc8d686541fd'
         '532bd6b7311636dbfbbdb2ee507cf5cd'
         '3b0f7e4cb64f2746855b9f79f5c16c34'
         'ecb3dfdbca1cd8a9e8ce3d1acfaf89da'
         '12dcdd6072051478379a7f416ee84599'
         'ac0c1f63e4f6ac8db83e99796713856d'
         '15d94c75154f4935dc2466a86855df3b'
         'a8bc13fe0b0cb43f0c519a6660d22c89'
         '8aa2133572200036e05c0afb271d6ea1'
         '4abff8fbefab1ac32dbac9e99f26fa70'
         '581f79331857ca21acfe37db25fee97b'
         '91a1d57f8d64568044e92a7f959ab6cb'
         '6e3a578dad515a7dd55526e4c6c865d5'
         'd58e0d5400a30dcab7c9b65dfeba01e7'
         'fd60210664e41212dac9d76d1232aea6'
         '0b7dcf570c4a96e67b56b8bad63420cd')
