# Maintainer: LEW21 <lew21@xtreeme.org>

pkgname=kernel26-drm-next
pkgver=20091118
_realver=2.6.31
_nextver=2.6.32
pkgrel=1
pkgdesc="KMS-enabled DRM kernel modules from Dave Airlie's drm-next branch. Radeon users: use with radeon-firmware, xf86-video-ati-git, mesa-full."
arch=(i686 x86_64)
url="http://airlied.livejournal.com/68097.html"
license=('LGPL')
depends=('glibc' "kernel26>=${_realver}" "kernel26<${_nextver}")
makedepends=('git' 'gcc')
source=('fix-config.patch' 'fix-version.patch')
md5sums=('9c17789cdd4d9d94ac5864f30941c685' '80e310bf12288089ee2436e3bf61c5e4')
install=('drm.install')

_gitroot="git://git.kernel.org/pub/scm/linux/kernel/git/airlied/drm-2.6.git"
_gitbranch="drm-next"
_gitname="drm-2.6"

build() {
	[ `uname -r` != '2.6.31-ARCH' ] && (
		msg "Reboot your system into Arch's 2.6.31 kernel before building this package."
		return 1
	)

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

	zcat /proc/config.gz > .config
	patch -Np0 -i "${srcdir}/fix-config.patch" || return 1

	# Remove rc9 and git's revision id from module's version number, so they won't conflict with Arch's kernel
	patch -Np0 -i "${srcdir}/fix-version.patch" || return 1
	rm -Rf .git

	make -j4 modules || return 1

	cd drivers/gpu/drm || return 1

	_drmdir=${pkgdir}/lib/modules/`uname -r`/kernel/drivers/gpu/drm.next
	mkdir -p ${_drmdir} || return 1
	for _file in *.ko
	do
		cp $_file ${_drmdir} || return 1
	done
	for _dir in *
	do
		if [ -d $_dir ]
		then
			mkdir ${_drmdir}/$_dir || return 1
			for _file in $_dir/*.ko
			do
				cp $_file ${_drmdir}/$_dir || return 1
			done
		fi
	done
}
