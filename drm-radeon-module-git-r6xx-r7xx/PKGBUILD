#Maintainer: Perry3D <perry3d@gmail.com> 

pkgname=drm-radeon-module-git-r6xx-r7xx
pkgver=20090625
pkgrel=1
pkgdesc="Required for kernel < 2.6.30 to get XV and EXA acceleration. Radeon and drm module r6xx-r7xx-branch. Use it with xf86-video-ati-git or xf86-video-radeonhd-git."
arch=(i686 x86_64)
depends=('glibc' 'libdrm' 'kernel26<2.6.30')
makedepends=('git' 'coreutils')
options=('!libtool')
url="http://dri.freedesktop.org/"
license=('custom')
groups=('xorg')
install=('drm.install')
source=()
md5sums=()

_gitroot="git://git.freedesktop.org/git/mesa/drm"
_gitname="drm"
_branch="r6xx-r7xx-support origin/r6xx-r7xx-support"

build() {
	export MAKEFLAGS=""
	msg "Connecting to git.freedesktop.org GIT server...."

	if [ -d ${srcdir}/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
		cd ${srcdir}/${_gitname}
		msg "Switch branch to r6xx-r7xx-support"
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
	install -m644 -D drm.ko $startdir/pkg/lib/modules/$(uname -r)/updates/drm.ko
	install -m644 -D radeon.ko $startdir/pkg/lib/modules/$(uname -r)/updates/radeon.ko
}
