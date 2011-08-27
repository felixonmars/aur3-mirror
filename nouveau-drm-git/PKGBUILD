# Maintainer: Tavian Barnes <tavianator@gmail.com>
# Based on work by nouveau-drm maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=nouveau-drm-git
pkgver=20100323
pkgrel=1
pkgdesc="nvidia opensource X driver"
arch=('i686' 'x86_64')
url="http://nouveau.freedesktop.org/"
depends=()
makedepends=('git')
# http://nouveau.freedesktop.org/wiki/InstallDRM#head-771a47a133fba6a5a70253656e76c61e9bff93bd
optdepends=('nouveau-firmware: may be needed for very new card (GF6 and above) to work properly where the OSS replacement does not work well')
install=${pkgname}.install
license=('GPL')
source=(Makefile)
md5sums=('e7d5df80186d5c736e82b0a7d46216bc')

_gitroot="git://anongit.freedesktop.org/git/nouveau/linux-2.6"
_gitname="linux-2.6"

_linus_gitroot="git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git"

_build_dir="$srcdir"

_skip_merge=1

build() {
	#################################
	# Get the latest kernel sources
	#################################
	msg "Fetching sources..."

	cd "$startdir"
	if [[ -d $_gitname ]]; then
		msg2 "Updating sources..."
		cd "$_gitname"                 &&
		git fetch origin master:master &&
		git fetch linus master:linus   &&
		cd "$OLDPWD"                   || return 1
	else
		msg2 "Cloning the project..."
		warning "The initial clone will download approximately 300 mb"
		mkdir -p "$_gitname"                    &&
		cd "$_gitname"                          &&
		git init --bare                         &&
		git remote add origin "$_gitroot"       &&
		git remote add linus "$_linus_gitroot"  &&
		git remote update                       &&
		git branch --track master origin/master &&
		git branch --track linus linus/master   &&
		cd "$OLDPWD"                            || return 1
	fi

	msg "Creating build branch..."
	rm -rf "$_build_dir/$_gitname-build"
	git clone "$_gitname" "$_build_dir/$_gitname-build" || return 1

	cd "$_build_dir/$_gitname-build" || return 1


	################################################################
	# Check out nouveau's tree, merging it onto Linus's if desired
	################################################################
	if [ -n "$_skip_merge" ]; then
		git checkout -q origin/master || return 1
	else
		git checkout -q origin/linus || return 1
		msg "Merging nouveau onto Linus's kernel tree"
		git merge --no-commit origin/master
		# Attempt to resolve conflicts with --theirs
		msg2 "Checking out drivers/gpu/drm/nouveau from the nouveau project"
		git checkout origin/master -- drivers/gpu/drm/nouveau &&
		git add drivers/gpu/drm/nouveau                       &&
		git commit -qm "Merge remote branch 'origin/master' into HEAD" || return 1
	fi

	mkdir nouveau
	cp ${srcdir}/Makefile nouveau/
	cd nouveau

	_kernels=$(find /lib/modules/ -mindepth 2 -maxdepth 2 -name 'build')

	for _kernel in $_kernels; do
		msg "Building module for $_kernel..."

		make LINUXDIR="$_kernel" DRM_MODULES="nouveau" || continue

		install -D -m 0644 ../drivers/gpu/drm/drm.ko ${pkgdir}/${_kernel}/../updates/drm.ko || return 1
		install -D -m 0644 ../drivers/gpu/drm/drm_kms_helper.ko ${pkgdir}/${_kernel}/../updates/drm_kms_helper.ko || return 1
		install -D -m 0644 ../drivers/gpu/drm/nouveau/nouveau.ko ${pkgdir}/${_kernel}/../kernel/drivers/gpu/drm/nouveau/nouveau.ko || return 1
		install -D -m 0644 ../drivers/gpu/drm/ttm/ttm.ko ${pkgdir}/${_kernel}/../updates/ttm.ko || return 1
		install -D -m 0644 ../drivers/gpu/drm/i2c/ch7006.ko ${pkgdir}/${_kernel}/../updates/ch7006.ko || return 1
	done

	install -D -m 0644 ../include/drm/nouveau_drm.h ${pkgdir}/usr/include/nouveau_drm.h || return 1

	# install script
	sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='$(uname -r)'/" ${startdir}/${pkgname}.install
}
