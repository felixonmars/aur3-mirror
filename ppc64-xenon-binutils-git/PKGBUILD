# Maintainer: Moritz Fischer <aur@pure-entropy.org>
pkgname=ppc64-xenon-binutils-git
pkgver=20111212
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files(Xenon homebrew development)."
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('git' 'libmpc' 'mpfr' 'gettext')
groups=('xenon-dev')
provides=('ppc64-xenon-binutils')
url="http://sources.redhat.com/binutils"
options=(strip !buildflags)

target=xenon
binutils_tar=binutils-2.21.1a
binutils=binutils-2.21.1

source=(http://ftp.gnu.org/gnu/binutils/binutils-2.21.1a.tar.bz2)

md5sums=('bde820eac53fa3a8d8696667418557ad')
conflicts=()

_gitroot=git://free60.git.sourceforge.net/gitroot/free60/free60
_gitname=free60



package() {
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

	msg "Patching binutils / gcc / newlib."
	cat free60/toolchain/binutils.diff  | patch -p0 || return 1
	cd build
	msg "Configuring binutils."
	../$binutils/configure --target=$target --prefix=/usr  --enable-multilib   --disable-nls --disable-werror || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
	msg "Cleaning binutils build remainders"
	cd ${srcdir} && rm -rf build/* && rm -r build

	rm -f ${pkgdir}/usr/lib/libiberty.a
	rm -f ${pkgdir}/usr/share/info/dir
	cd ${pkgdir}/usr/share/info
	for file in as bfd binutils configure gprof ld standards ; do
		mv ${file}.info "xenon-${file}.info"
	done

}
