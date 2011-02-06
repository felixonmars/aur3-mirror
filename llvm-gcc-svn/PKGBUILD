# Contributor: Ralph Eastwood <tcmreastwood@ntlworld.com>
gccver=4.2
pkgname=llvm-gcc-svn
pkgver=2.4
pkgrel=3
pkgdesc="A toolkit for the construction of highly optimized compilers, optimizers, and runtime environments. This is the GCC frontend to the toolkit."
url="http://llvm.org"
arch=(i686 x86_64)
conflicts=(llvm-gcc)
provides=(llvm-gcc)
makedepends=(svn)
license=('GPL')
#source=(llvm-gcc.sh
#        gcc_pure64.patch)
#md5sums=('885ae17adddd464bff522626bc65f850'
#         '1ceaa49e3a1d9f984ecc2893c43f7425')
source=(gcc_pure64.patch)
md5sums=('421fd52107c67ea8f5f41c6b68b458ff')

build() {
	cd $startdir/src
	svn co http://llvm.org/svn/llvm-project/llvm-gcc-$gccver/trunk llvm-gcc
	svn revert llvm-gcc/gcc/config/i386/linux64.h
	svn revert llvm-gcc/gcc/config/i386/t-linux64
	cd llvm-gcc

	BUILDOPTIONS=LLVM_VERSION_INFO=2.4
	
	if [ "${CARCH}" = "x86_64" ]; then
		patch -Np1 -i ../gcc_pure64.patch || return 1
	fi

	# Don't install libiberty
	sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

	# Don't run fixincludes
	sed -i -e 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
	
	# For some reason this is used by default - remove it
	rm GNUmakefile

	mkdir ../gcc-build
	cd ../gcc-build

	../llvm-gcc/configure --prefix=/usr --program-prefix=llvm- --enable-languages=c,c++ --disable-shared --disable-multilib --with-tune=generic --enable-threads=posix --enable-__cxa_atexit --libdir=/usr/lib --libexecdir=/usr/lib --enable-clocale=gnu --disable-libstdcxx-pch

	make $BUILDOPTIONS || return 1
	make DESTDIR=$startdir/pkg install

	rm -f ${startdir}/pkg/usr/lib/lib{stdc++,supc++,gcc_s}.*
	#rm -f ${startdir}/pkg/usr/share/locale/*/LC_MESSAGES/libstdc++.mo
	rm -rf ${startdir}/pkg/usr/share/locale
	rm -rf ${startdir}/pkg/usr/man/man7

	#mkdir $startdir/pkg/etc
	#mkdir $startdir/pkg/etc/profile.d
	#cp $startdir/llvm-gcc.sh $startdir/pkg/etc/profile.d/
}

