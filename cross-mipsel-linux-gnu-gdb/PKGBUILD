# Contributor: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=cross-mipsel-linux-gnu-gdb
_pkgname=gdb
_target="mipsel-linux-gnu"
pkgver=7.8.1
pkgrel=1
pkgdesc="The GNU debugger for the MIPS architecture"
url="http://www.gnu.org/software/gdb/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses' 'expat' "cross-${_target}-binutils")
source=("ftp://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.xz")
md5sums=('8072be87a94be0936bc3b4b6941b0862')
_sysroot="/usr/lib/cross-${_target}"

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	export CPPFLAGS="$CPPFLAGS -U_FORTIFY_SOURCE"
	
	./configure \
		"--prefix=${_sysroot}" \
		"--bindir=/usr/bin" "--program-prefix=${_target}-" \
		"--with-sysroot=${_sysroot}" \
		"--target=${_target}"
		
	make
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	make DESTDIR=${pkgdir} install
	
	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native GDB)
	rm -Rf ${pkgdir}${_sysroot}/share/{man,info}
	# remove conflicting binaries
	find ${pkgdir}/usr/bin/ -type f -not -name 'mipsel-linux-gnu-*' -delete
	# remove conflicts with binutils
	rm -f ${pkgdir}${_sysroot}/lib/libiberty.a
	
	msg "Creating out-of-path executables..."
	# symlink executables to single directory with no-arch-prefix name
	mkdir -p ${pkgdir}/usr/bin/cross/${_target}/;
	cd ${pkgdir}/usr/bin/cross/${_target}/;
	for bin in ${pkgdir}/usr/bin/${_target}-*; do
		bbin=`basename "$bin"`;
		ln -s "/usr/bin/${bbin}" `echo "$bbin" | sed "s#^${_target}-##"`;
	done
}
