# Contributor: Casey Banner <kcbanner@gmail.com>
# PKGBUILD based on cross-m68k-elf-gcc
# (made by: Peter B <peterbjorgensen at gmail> 

pkgname=cross-m68k-elf-gcc3
_pkgname=gcc
_target="m68k-elf"
pkgver=3.4.6
pkgrel=0
pkgdesc="The GNU Compiler Collection for the Motorola M68000 architecture, GCC 3 Version."
url="http://www.gnu.org/software/binutils/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mpfr' 'sh' "cross-m68k-elf-binutils" 'cloog' 'ppl')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=("ftp://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/${_pkgname}-core-${pkgver}.tar.bz2"
	"http://www.rockbox.org/gcc/gcc-3.4.6-amd64.patch")
md5sums=('5324ace5145b12afd9ca867af7ec084d'
	 '2f57b8859a9335d587bab005685799d9')
_sysroot="/usr/lib/cross-${_target}"

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	
	patch -p1 < ../gcc-3.4.6-amd64.patch

	./configure \
		"--prefix=${_sysroot}" \
		"--program-prefix=${_target}-" \
                "--bindir=/usr/bin" \
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

