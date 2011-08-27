# Maintainer: LEW21 <lew21@xtreeme.org>

pkgname=radeon-firmware
pkgver=20090926
_realver=2.6.31
_nextver=2.6.32
pkgrel=1
pkgdesc="Firmware for Radeon graphic cards from Dave Airlie's drm-next branch."
arch=(i686 x86_64)
url="http://airlied.livejournal.com/68097.html"
license=('LGPL')
depends=('glibc' "kernel26>=${_realver}" "kernel26<${_nextver}")
makedepends=('git' 'gcc')
source=('.config')
md5sums=('48faed3a3c96004b60bd839a68d57eb7')

_gitroot="git://git.kernel.org/pub/scm/linux/kernel/git/airlied/drm-2.6.git"
_gitbranch="drm-next"
_gitname="drm-2.6"

build() {
	msg "Connecting to git.kernel.org GIT server...."

	if [ -d $startdir/src/$_gitname ] ; then
		cd $_gitname || return 1
		(
			git checkout master -f
			git branch -D drm-next
		) 2> /dev/null
		git pull origin || return 1
		msg "The local files are updated."
	else
		git clone $_gitroot --depth 1
		cd $_gitname || return 1
		msg "GIT checkout done."
	fi

	msg "Selecting a branch: $_gitbranch"
	git checkout -b $_gitbranch origin/$_gitbranch

	msg "Starting make..."

	rm -rf $startdir/src/$_gitname-build
	cp -rH $startdir/src/$_gitname $startdir/src/$_gitname-build
	cd $startdir/src/$_gitname-build

	cp ${srcdir}/.config .

	make modules || return 1

	mkdir -p ${pkgdir}/lib/firmware/radeon || return 1
	cp firmware/radeon/*.bin ${pkgdir}/lib/firmware/radeon || return 1
}
