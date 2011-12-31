# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
pkgname=cross-ppc32-binutils
_pkgname=binutils
_target="powerpc-unknown-linux-gnu"
pkgver=2.22
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for PowerPC (32 bit) architecture"
url="http://www.gnu.org/software/binutils/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
source=("ftp://ftp.gnu.org/gnu/binutils/${_pkgname}-${pkgver}.tar.bz2")
_sysroot="/usr/lib/cross-${_target}"

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	./configure \
		"--prefix=${_sysroot}" \
		"--bindir=/usr/bin" "--program-prefix=${_target}-" \
		"--with-sysroot=${_sysroot}" \
		"--target=${_target}" "--build=$CHOST" "--host=$CHOST" \
		"--disable-nls" \
		--with-gcc --with-gnu-as --with-gnu-ld \
		--without-included-gettext \
		|| return 1
		
	make all || return 1
	make DESTDIR=${pkgdir} install || return 1
	
	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native binutils)
	rm -Rf ${pkgdir}${_sysroot}/share/{man,info}
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

md5sums=('ee0f10756c84979622b992a4a61ea3f5')
