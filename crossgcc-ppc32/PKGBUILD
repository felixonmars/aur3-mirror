# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=crossgcc-ppc32
_pkgname=gcc
_target="powerpc-unknown-linux-gnu"
pkgver=4.5.2
pkgrel=1
pkgdesc="The GNU Compiler Collection for the PowerPC (32 bit) architecture"
url="http://www.gnu.org/software/binutils/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mpfr' 'gmp' 'libmpc' 'sh' "crossbinutils-ppc32" 'cloog-ppl')
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
		--disable-nls --disable-threads \
		--enable-languages=c,c++ --disable-libgcj \
		--enable-shared --enable-threads=posix \
	 	--enable-lto --enable-gnu-unique-object \
		--disable-libstdcxx-pch \
		--with-system-zlib --with-ppl --with-cloog \
		|| return 1
	
	make all-gcc "inhibit_libc=true" || return 1
}
package() {
	cd  ${srcdir}/${_pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install-gcc || return 1
	
	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native gcc)
	rm -Rf ${pkgdir}/usr/share/{man,info}
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

md5sums=('aa9e36bec080452372bfba793428ee82'
         '9821f1c61e43755866861485ff364e90')
