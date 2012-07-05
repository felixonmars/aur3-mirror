# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
# Updated by dimigon to support a normal Sparc (not Sparc64)
pkgname=cross-sparc-linux-gnu-gcc
_pkgname=gcc
_target="sparc-linux-gnu"
pkgver=4.6.0
pkgrel=2
pkgdesc="The GNU Compiler Collection for the Sparc architecture"
url="http://www.gnu.org/software/binutils/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mpfr>=2.3.1' 'gmp>=4.2' 'libmpc>0.8' 'sh' "cross-${_target}-binutils")
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=(ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-core-${pkgver}.tar.bz2
	https://raw.github.com/quantumdream/misc/master/patches/gengtype.patch)
md5sums=('b1957f3209080b2f55bc3756d3a62b7c'
	 '177b45c26105c833adc56ef5b1d7f3a8')
_sysroot="/usr/lib/cross-${_target}"

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	patch -Np1 -i ../gengtype.patch
	
	./configure \
		"--prefix=${_sysroot}" \
		"--bindir=/usr/bin" "--program-prefix=${_target}-" \
		"--with-sysroot=${_sysroot}" \
		"--target=${_target}" "--build=$CHOST" "--host=$CHOST" \
		--with-gnu-as --with-gnu-ld \
		--disable-nls --disable-threads \
		--enable-languages=c \
		--disable-multilib --disable-libgcj \
		--without-headers --disable-shared
	
	make all-gcc "inhibit_libc=true"
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	make DESTDIR=${pkgdir} install-gcc
	
	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native gcc)
	rm -Rf ${pkgdir}${_sysroot}/{man,info}
	# remove conflicting binaries
	find ${pkgdir}/usr/bin/ -type f -not -name "${_target}-*" -delete
	
	msg "Creating out-of-path executables..."
	# symlink executables to single directory with no-arch-prefix name
	mkdir -p ${pkgdir}/usr/bin/cross/${_target}/;
	cd ${pkgdir}/usr/bin/cross/${_target}/;
	for bin in ${pkgdir}/usr/bin/${_target}-*; do
		bbin=`basename "$bin"`;
		ln -s "/usr/bin/${bbin}" `echo "$bbin" | sed "s#^${_target}-##"`;
	done
}
