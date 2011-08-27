# Contributor: Peter B <peterbjorgensen at gmail> 
# PKGBUILD based on cross-mipsel-linux-gnu-gcc
# (made by: Vojtech Horky <vojta . horky at-symbol seznam . cz>)
pkgname=cross-m68k-elf-gcc
_pkgname=gcc
_target="m68k-elf"
pkgver=4.6.0
pkgrel=1
pkgdesc="The GNU Compiler Collection for the Motorola M68000 architecture"
url="http://www.gnu.org/software/binutils/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mpfr' 'sh' "cross-m68k-elf-binutils" 'cloog' 'ppl')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=("ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-core-${pkgver}.tar.bz2")
md5sums=('b1957f3209080b2f55bc3756d3a62b7c')
_sysroot="/usr/lib/cross-${_target}"

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	./configure \
		"--prefix=${_sysroot}" \
		"--bindir=/usr/bin" "--program-prefix=${_target}-" \
		"--with-sysroot=${_sysroot}" \
		"--target=${_target}" "--build=$CHOST" "--host=$CHOST" \
		--with-gnu-as --with-gnu-ld \
		--disable-nls --disable-threads \
		--enable-languages=c \
		--disable-multilib --disable-libgcj \
		--without-headers --disable-shared \
		|| return 1
	
	make all-gcc "inhibit_libc=true" || return 1
	
	make DESTDIR=${pkgdir} install-gcc || return 1
	
	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native gcc)
	rm -Rf ${pkgdir}${_sysroot}/{man,info}
	# remove conflicting binaries
	find ${pkgdir}/usr/bin/ -type f -not -name 'm68k-elf*' -delete
	
	msg "Creating out-of-path executables..."
	# symlink executables to single directory with no-arch-prefix name
	mkdir -p ${pkgdir}/usr/bin/cross/${_target}/;
	cd ${pkgdir}/usr/bin/cross/${_target}/;
	for bin in ${pkgdir}/usr/bin/${_target}-*; do
		bbin=`basename "$bin"`;
		ln -s "/usr/bin/${bbin}" `echo "$bbin" | sed "s#^${_target}-##"`;
	done
}

