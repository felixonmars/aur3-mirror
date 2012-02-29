# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=cross-ppc32-gcc
_pkgname=gcc
_target="powerpc-unknown-linux-gnu"
pkgver=4.6.2
pkgrel=1
pkgdesc="The GNU Compiler Collection for the PowerPC (32 bit) architecture"
url="http://www.gnu.org/software/binutils/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mpfr' 'gmp' 'libmpc' 'sh' "cross-ppc32-binutils" 'cloog' 'ppl')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=(ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-{core,g++}-${pkgver}.tar.bz2)
_sysroot="/usr/lib/cross-${_target}"

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
		#"--with-sysroot=${_sysroot}" \
		#"--prefix=${_sysroot}" \
	./configure \
		--prefix=/usr \
		"--bindir=/usr/bin" "--program-prefix=${_target}-" \
		"--target=${_target}" "--build=$CHOST" "--host=$CHOST" \
		--with-libs --with-headers \
		--with-as=/usr/bin/${_target}-as --with-ld=/usr/bin/${_target}-ld \
		--with-ar=/usr/bin/${_target}-ar --with-ranlib=/usr/bin/${_target}-ranlib \
		--enable-shared --enable-threads=posix \
		--enable-languages=c,c++ \
      		--with-system-zlib --enable-__cxa_atexit \
      		--disable-libunwind-exceptions --enable-clocale=gnu \
      		--enable-gnu-unique-object --enable-linker-build-id \
      		--with-ppl --enable-cloog-backend=isl \
      		--enable-lto --enable-gold --enable-ld=default \
      		--enable-plugin --with-plugin-ld=ld.gold \
      		--disable-multilib --enable-libssp  --disable-libstdcxx-pch \
      		--enable-checking=release	
	make all-gcc "inhibit_libc=true" || return 1
}
package() {
	cd  ${srcdir}/${_pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install-gcc || return 1
	
	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native gcc)
	rm -Rf ${pkgdir}/usr/share/{locale,man,info}
	# remove conflicting binaries
	find ${pkgdir}/usr/bin/ -type f -not -name 'powerpc-unknown-linux-gnu-*' -delete
	
	msg "Creating out-of-path executables..."
	# symlink executables to single directory with no-arch-prefix name
	mkdir -p ${pkgdir}/usr/bin/cross/${_target}/;
	cd ${pkgdir}/usr/bin/cross/${_target}/;
	for bin in ${pkgdir}/usr/bin/${_target}-*; do
		bbin=`basename "$bin"`;
		ln -s "/usr/bin/${bbin}" `echo "$bbin" | sed "s#^${_target}-##"`;
	done
}

md5sums=('780f614ab18c7a9066dec6387d7490b2'
         '87ecd60431e41096419dd8a10f76e46b')
