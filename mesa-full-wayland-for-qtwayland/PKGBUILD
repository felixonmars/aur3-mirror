# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

# Based on mesa-full-wayland by LEW21 <lew21@xtreeme.org>

pkgname=mesa-full-wayland-for-qtwayland
pkgver=20121002
_realver=9.1
pkgrel=1
pkgdesc="Full Mesa 3D graphics library with all its components, built from the git master branch. Identical to mesa-full, except it adds Wayland support."
arch=(i686 x86_64)
url="http://mesa3d.org/"
license=('LGPL')
depends=('libdrm>=2.4.34' 'dri2proto>=2.3' 'glproto>=1.4.12' 'libxxf86vm' 'libxdamage' 'expat>=2.0.1' 'llvm' 'wayland=0.95')
makedepends=('git' 'pkgconfig' 'imake' 'python2' 'python2-lxml')
optdepends=('libtxc_dxtn: S3TC support'
'mesa-demos: glxinfo and glxgears')
provides=("mesa=${_realver}" "mesa-full-wayland=${_realver}" "libgl=${_realver}" "libglapi=${_realver}" "libgles=${_realver}" "libegl=${_realver}" "ati-dri=${_realver}" "intel-dri=${_realver}" "nouveau-dri=${_realver}", "khrplatform-devel=${_realver}" "libgbm=${_realver}")
conflicts=('mesa' 'mesa-full-wayland' 'libgl' 'libglapi' 'libgles' 'libegl' 'ati-dri' 'intel-dri' 'nouveau-dri' 'mach64-dri' 'mga-dri' 'r128-dri' 'savage-dri' 'tdfx-dri' 'unichrome-dri', 'khrplatform-devel' 'libgbm')

_gitroot="git://anongit.freedesktop.org/git/mesa/mesa"
_gitname="mesa"
_githash="be4c0a243e3314b8d8d24107494e2537a6d198ad"

build() {
	msg "Connecting to the GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname
		git pull origin master
		cd ..
	else
		git clone $_gitroot
	fi

	cd $_gitname && git checkout $_githash || exit $?

	msg "Creating build directory..."
	rm -rf ${srcdir}/$_gitname-build
	cp -r ${srcdir}/$_gitname ${srcdir}/$_gitname-build

	msg "Starting build..."
	cd ${srcdir}/$_gitname-build

	# Classic r300, r600 & swrast are disabled - their Gallium versions are better.
	# Classic nouveau is for different hardware than Gallium nouveau, so both are enabled.

	# If you live in the US, you should delete --enable-texture-float \ line.

	./autogen.sh --prefix=/usr --with-dri-driverdir=/usr/lib/xorg/modules/dri \
		--with-dri-drivers=i915,i965,nouveau,radeon,r200 \
		--with-gallium-drivers=r300,r600,nouveau,svga,swrast \
		--with-egl-platforms=drm,x11,wayland \
		--enable-gallium-llvm \
		--enable-gallium-egl \
		--enable-gallium-gbm \
		--enable-egl \
		--enable-gles1 \
		--enable-gles2 \
		--enable-openvg \
		--enable-glx-tls \
		--enable-texture-float \
#		--enable-r600-llvm-compiler \

	make
}

package() {
	cd ${srcdir}/$_gitname-build

	make DESTDIR="${pkgdir}" install

	install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
	ln -sf libglx.xorg ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so
}
