
_pkgname=gcc
_target="powerpc-unknown-elf"
_sysroot="/usr/lib/cross-${_target}"

pkgname=${_target}-${_pkgname}
pkgver=4.8.0
pkgrel=1
pkgdesc="Bare-metal gcc/g++ for powerpc targets"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=("${_target}-binutils")
makedepends=('libmpc' 'cloog')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip' '!buildflags')
source=("ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-${pkgver}.tar.bz2")

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	# Do not run fixincludes
	sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

	# some configure tests for header files using "$CPP $CPPFLAGS"
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

	msg "Downloading prequisites..."
	# get mpfr mpc gmp
	#./contrib/download_prerequisites

	# cleanup/setup build directory
	rm -rf build
	mkdir build
}

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}/build

	../configure --prefix=${_sysroot} \
		--with-sysroot=${_sysroot} \
		--target=${_target} \
		--enable-long-long \
		--enable-languages=c,c++ \
		--disable-shared \
		--enable-multilib \
		--without-headers \
		--with-gnu-as \
		--with-gnu-ld \
		--with-newlib \
		--disable-nls \
		--disable-threads \
		--disable-libgcj \
		--enable-lto

	make all-gcc all-target-libgcc || return 1
}
 
package() {
	cd ${srcdir}/${_pkgname}-${pkgver}/build

	make DESTDIR=${pkgdir} install-gcc install-target-libgcc || return 1

	msg "Cleaning-up cross compiler tree..."
	rm -rf ${pkgdir}/${_sysroot}/share/{info,man}

	msg "Creating out-of-path executables..."
	mkdir -p ${pkgdir}/${_sysroot}/${_target}/bin/
	cd ${pkgdir}${_sysroot}/${_target}/bin/
	for bin in ${pkgdir}${_sysroot}/bin/${_target}-*; do
		bbin=`basename "$bin"`;
		ln -s ${_sysroot}/bin/$bbin `echo "$bbin" | sed "s#^${_target}-##"`;
	done

	msg "Creating /usr/bin symlinks..."
	mkdir -p $pkgdir/usr/bin
	for bin in ${pkgdir}${_sysroot}/bin/${_target}-*; do
		bbin=`basename "$bin"`;
		ln -s "${_sysroot}/bin/${bbin}" "${pkgdir}/usr/bin/${bbin}";
	done
}

md5sums=('e6040024eb9e761c3bea348d1fa5abb0')

# vim: set noet ci pi sts=0 sw=4 ts=4:
