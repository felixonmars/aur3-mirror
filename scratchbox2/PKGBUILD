# Maintainer: damkrat <akm47c[at]gmail.com>
# Contributor: damkrat <akm47c[at]gmail.com>
pkgname=scratchbox2
pkgver=2.1.86.g173e4b7
pkgrel=1
pkgdesc="The unobtrusive cross-compilation engine."
arch=('i686' 'x86_64')
url="http://maemo.gitorious.org/scratchbox2"
license=('GPL')
conflicts=('scratchbox2-git')
provides=('scratchbox2')

[ $CARCH = 'i686' ]   && makedepends=('git') \
                      && depends=('glibc' 'perl')
[ $CARCH = 'x86_64' ] && makedepends=('gcc-multilib' 'binutils-multilib' 'gcc-libs-multilib' 'git' ) \
                      && depends=('lib32-glibc' 'perl')

#source=("$pkgname"::'https://git.gitorious.org/scratchbox2/scratchbox2.git')

_gitroot="https://git.gitorious.org/scratchbox2/scratchbox2.git"
_gitname="scratchbox2"

build() {
	export LDFLAGS="${LDFLAGS//-Wl,--as-needed}"

	cd ${srcdir}

	msg "Checking out source..."
	if [ ! -d ${srcdir}/$_gitname ] ; then
		git clone $_gitroot $_gitname || return 1
	else
		cd $_gitname && git pull
	fi

	cd ${srcdir}/$_gitname
	./autogen.sh
	./configure --prefix=/usr
	make -j2 || return 1
}

pkgver() {
	cd ${srcdir}/$_gitname
	# Use the tag of the last commit
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

package() {
	cd ${srcdir}/$_gitname
	make prefix="$pkgdir/usr/" install || return 1
}