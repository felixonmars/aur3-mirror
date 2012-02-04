# Maintainer: Moritz Fischer <aur@pure-entropy.org>
pkgname=ppc64-xenon-gcc-elf-git
pkgver=20110915
pkgrel=1
pkgdesc="The GNU Compiler Collection - Cross compiler for ppc64-xenon target"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('git' 'libmpc' 'mpfr' 'gettext' 'ppc64-xenon-binutils' 'ppc64-xenon-gcc-base' 'ppc64-xenon-newlib')
provides=('ppc64-xenon-gcc-elf')
url="http://gcc.gnu.org/"
options=(!strip !buildflags)

target=xenon
gcc=gcc-4.6.1

source=(ftp://ftp.gnu.org/gnu/gcc/${gcc}/${gcc}.tar.bz2)

md5sums=('c57a9170c677bf795bdc04ed796ca491')
conflicts=(ppc64-xenon-gcc-base)

_gitroot=git://free60.git.sourceforge.net/gitroot/free60/free60
_gitname=free60



build() {
	cd ${srcdir}

	if [ -d $_gitname ]; then
		cd $_gitname && git reset HEAD --hard && git clean -x -d -f && git pull origin
		msg "Updated the local files."
	else
		git clone $_gitroot
		msg "GIT checkout done or server timeout"
	fi

	cd ${srcdir}

	if [ -d build ]; then
		rm -rf build/*
	else
		mkdir build
	fi

	msg "Patching gcc"
	cat free60/toolchain/gcc-4.6.1.diff | patch -p0 || return 1
	cd build

	msg "Configuring gcc for second pass compilation."
	../$gcc/configure --target=$target --prefix=/usr \
		--with-cpu=cell --disable-decimal-float --disable-libquadmath \
		--enable-languages=c,c++ --disable-libssp --with-newlib --enable-cxx-flags="-G0" \
		--disable-libmudflap --disable-nls --disable-shared --disable-linux-futex \
		--enable-altivec --disable-threads --disable-libgomp || return 1
	msg "Building gcc second pass."
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
	msg "Cleaning all build remainders"
	cd ${srcdir} && rm -rf build/* && rm -r build

	rm -f ${pkgdir}/usr/lib/libiberty.a
	rm -f ${pkgdir}/usr/share/info/dir
	rm -r ${pkgdir}/usr/share/gcc-4.6.1/python/libstdcxx/
	rm -rf ${pkgdir}/usr/share/man/man7

	cd ${pkgdir}/usr/share/info
	for file in cpp cppinternals gcc gccinstall gccint; do
		mv ${file}.info "xenon-${file}.info"
	done
	

}
