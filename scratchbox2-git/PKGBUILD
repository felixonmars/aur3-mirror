# Contributor: Christopher Schwaab -- christopher.schwaab gmail
pkgname=scratchbox2-git
pkgver=9999
pkgrel=3
pkgdesc="The unobtrusive cross-compilation engine."
arch=('i686' 'x86_64')
url="http://maemo.gitorious.org/scratchbox2"
[ $CARCH = 'i686' ]   && makedepends=('git') \
                      && depends=('glibc' 'perl')
[ $CARCH = 'x86_64' ] && makedepends=('gcc-multilib' 'binutils-multilib' 'gcc-libs-multilib' 'git' ) \
                      && depends=('lib32-glibc' 'perl')
license=('GPL')

build() {
	_gitroot="git://gitorious.org/scratchbox2/scratchbox2.git"
	_gitname="scratchbox2"

	export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"

	cd ${srcdir}

	msg "Checking out source..."
	if [ ! -d ${srcdir}/$_gitname ] ; then
		git clone $_gitroot $_gitname || return 1
	else
		cd $_gitname && git pull
	fi

	cd $srcdir/$_gitname
	./autogen.sh || return 1
	./configure || return 1
	make -j1 || return 1
	mkdir -p $pkgdir/usr
	make -j1 prefix=$pkgdir/usr DESTDIR=$pkgdir/usr install || return 1
}
