# Maintainer: Moritz Fischer <aur@pure-entropy.org>
pkgname=ppc64-xenon-newlib-git
pkgver=20110915
pkgrel=1
pkgdesc="Newlib is a C library intended for use on embedded systems."
arch=('i686' 'x86_64')
license=('GPL')
depends=()
makedepends=('git' 'libmpc' 'mpfr' 'gettext' 'ppc64-xenon-binutils' 'ppc64-xenon-gcc-base')
provides=('ppc64-xenon-newlib')
url="http://sourceware.org/newlib"
options=(!strip !buildflags)

target=xenon
newlib=newlib-1.17.0

source=(ftp://sources.redhat.com/pub/newlib/${newlib}.tar.gz)

md5sums=('9c345928b4f600a211ddc5a6072f8337')
conflicts=()

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

	msg "Patching newlib."
	cat free60/toolchain/newlib.diff    | patch -p0 || return 1
	msg "Configuring newlib."
	cd build
  ../$newlib/configure --target=$target --prefix=/usr  --enable-multilib \
		--disable-nls CFLAGS='-DHAVE_BLKSIZE' --enable-newlib-io-long-long \
		--enable-newlib-io-long-double || return 1
	msg "Building newlib."
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
	cd ${srcdir} && rm -rf build/* && rm -r build

	rm -f ${pkgdir}/usr/share/info/dir
}
