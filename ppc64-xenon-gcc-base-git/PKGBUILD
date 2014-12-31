# Maintainer: Moritz Fischer <aur@pure-entropy.org>
pkgname=ppc64-xenon-gcc-base-git
pkgver=20111212
pkgrel=1
pkgdesc="The GNU Compiler Collection - Cross compiler for ppc64-xenon target"
arch=('i686' 'x86_64')
license=('GPL')
depends=()
groups=('xenon-dev')
makedepends=('git' 'libmpc' 'mpfr' 'gettext' 'ppc64-xenon-binutils' 'texinfo-legacy')
provides=('ppc64-xenon-gcc-base')
url="http://gcc.gnu.org/"
options=(!strip !buildflags)

target=xenon
gcc=gcc-4.6.1

source=("ftp://ftp.gnu.org/gnu/gcc/${gcc}/${gcc}.tar.bz2"
	"gcc461-compilation-incompat.diff"
	"gcc461-makeinfo-patch.diff")

md5sums=('c57a9170c677bf795bdc04ed796ca491'
         '6e70bf9bba3110bad706467880d6cfb8'
         '88d3e20e79f7f38198233c6bb2d550cd')

conflicts=(ppc64-xenon-gcc-elf)

_gitroot=git://free60.git.sourceforge.net/gitroot/free60/free60
_gitname=free60



package() {
	export PATH=$PATH:${pkgdir}/usr/bin
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

	msg "Patching gcc."
	cat free60/toolchain/gcc-4.6.1.diff | patch -p0 || return 1
	cat gcc461-makeinfo-patch.diff | patch -p0 || return 1
	cat gcc461-compilation-incompat.diff | patch -p0 || return 1
	cd build

	msg "Configuring gcc."
	../$gcc/configure --target=$target --prefix=/usr -enable-interwork \
		--enable-languages=c --without-headers --disable-shared \
		--with-newlib --disable-libmudflap --disable-libssp --disable-nls --disable-shared --without-headers \
		--disable-decimal-float --enable-altivec\
		--with-cpu=cell || return 1 
	msg "Building gcc first pass."
	make all-gcc || return 1
	make DESTDIR=${pkgdir} install-gcc || return 1
	cp ${pkgdir}/usr/bin/xenon-gcc ${pkgdir}/usr/bin/xenon-cc
	msg "Cleaning gcc build remainders"
	cd ${srcdir} && rm -rf build/*
	
	rm -f ${pkgdir}/usr/share/info/dir
	rm -rf ${pkgdir}/usr/share/man/man7

	cd ${pkgdir}/usr/share/info
	for file in cpp cppinternals gcc gccinstall gccint; do
		mv ${file}.info "xenon-${file}.info"
	done

}
