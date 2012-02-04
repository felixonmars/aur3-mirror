#Maintainer: Perry3D <perry3d@gmail.com> 

pkgname=drm-radeon-module-git-r6xx-r7xx-3d
pkgver=20090920
pkgrel=1
pkgdesc="radeon and drm module r6xx-r7xx-3d."
arch=(i686 x86_64)
depends=('glibc' 'libdrm')
makedepends=('git')
options=('!libtool')
url="http://dri.freedesktop.org/"
license=('custom')
groups=('xorg')
install=('drm.install')
source=()
md5sums=()

_kernver=$(uname -r)
_gitroot="git://anongit.freedesktop.org/~agd5f/drm"
_gitname="drm"
_branch="r6xx-r7xx-3d origin/r6xx-r7xx-3d"

build() {
	export MAKEFLAGS=""
	msg "Connecting to git.freedesktop.org GIT server...."

	if [ -d ${srcdir}/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
		cd ${srcdir}/${_gitname}
		msg "Switch branch to r6xx-r7xx-3d"
		git checkout -b $_branch
	fi


	msg "GIT checkout done or server timeout"
	cd ${srcdir}
	rm -rf ${_gitname}-build
	git clone $_gitname $_gitname-build
	cd ${srcdir}/$_gitname-build

	msg "Starting make..."
	cd linux-core
	make radeon.o || return 1
	install -m644 -D drm.ko $startdir/pkg/lib/modules/${_kernver}/updates/drm.ko
	install -m644 -D radeon.ko $startdir/pkg/lib/modules/${_kernver}/updates/radeon.ko
}
