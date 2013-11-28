# Contributor: SebRmv <sbriais at-symbol free dot fr> 
# PKGBUILD based on cross-mipsel-linux-gnu-gcc
# (made by: Vojtech Horky <vojta . horky at-symbol seznam . cz>)
pkgname=cross-m68k-atari-mint-gcc-core
_pkgname=gcc
_target="m68k-atari-mint"
pkgver=4.6.4
pkgrel=2
pkgdesc="The GNU Compiler Collection for the Motorola M68000 architecture"
url="http://www.gnu.org/software/gcc/"
arch=('i686' 'x86_64')
license=('GPL')
conflicts=('cross-m68k-atari-mint-gcc')
depends=('mpfr' 'sh' "cross-m68k-atari-mint-binutils" 'cloog' 'ppl')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip' 'staticlibs')
source=("ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-core-${pkgver}.tar.bz2" "gcc-core-4.6.4-mint-20130415.patch.bz2")
sha1sums=('9b2f25ac248d81c97bbe46690dc2c350e51996a5' 'a3c7bcc8f3425b7e4fa5e268388c33fb355a698c')
_sysroot="/usr/lib/cross-${_target}"


prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}

        patch -Np1 < ../gcc-core-4.6.4-mint-20130415.patch
}

build() {
	mkdir -p ${srcdir}/build

	cd ${srcdir}/build

        CFLAGS=${CFLAGS//-D_FORTIFY_SOURCE=?/}
        export CFLAGS
        
        CPPFLAGS=${CPPFLAGS//-D_FORTIFY_SOURCE=?/}
        export CPPFLAGS
	
	../${_pkgname}-${pkgver}/configure \
		"--prefix=${_sysroot}" \
		"--bindir=/usr/bin" "--program-prefix=${_target}-" \
		"--target=${_target}" "--build=$CHOST" "--host=$CHOST" \
                --with-gnu-as --with-gnu-ld \
		--disable-nls --disable-threads \
		--enable-languages=c \
		--disable-libgcj \
		--disable-shared \
        	CFLAGS_FOR_TARGET="-O2 -fomit-frame-pointer" \
		|| return 1
	
	make all-gcc "inhibit_libc=true" || return 1
	
   	make all-target-libgcc || return 1
}

package() {
	cd ${srcdir}/build

	make DESTDIR=${pkgdir} install-gcc || return 1
	make DESTDIR=${pkgdir} install-target-libgcc || return 1

	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native gcc)
	rm -Rf ${pkgdir}${_sysroot}/share/{man,info}
	# remove conflicting binaries
	find ${pkgdir}/usr/bin/ -type f -not -name 'm68k-atari-mint*' -delete

	msg "Creating out-of-path executables..."
	# symlink executables to single directory with no-arch-prefix name
	mkdir -p ${pkgdir}/usr/bin/cross/${_target}/;
	cd ${pkgdir}/usr/bin/cross/${_target}/;
	for bin in ${pkgdir}/usr/bin/${_target}-*; do
		bbin=`basename "$bin"`;
		ln -s "/usr/bin/${bbin}" `echo "$bbin" | sed "s#^${_target}-##"`;
	done

        mkdir -p ${pkgdir}/usr/lib/cross-${_target}/lib/gcc/${_target}/${pkgver}/m68000
        cd ${pkgdir}/usr/lib/cross-${_target}/lib/gcc/${_target}/${pkgver}/m68000
        ln -s ../libgcc.a .
        ln -s ../libgcov.a .
}

