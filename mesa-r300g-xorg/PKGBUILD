# Maintainer: Martin Stolpe <martinstolpe {at} gmail dot com>
# based on mesa-full from LEW21 <lew21@xtreeme.org>

pkgname=mesa-r300g-xorg
pkgver=20100928
_realver=7.8
pkgrel=2
pkgdesc="Full Mesa 3D graphics library with all its components, built from the git master branch."
arch=(i686 x86_64)
url="http://mesa3d.org/"
license=('LGPL')
depends=('libdrm>=2.4.15' 'dri2proto>=2.1' 'glproto>=1.4.10' 'libxxf86vm' 'libxdamage' 'expat>=2.0.1')
makedepends=('pkgconfig' 'imake')
provides=("libgl=${_realver}" "mesa=${_realver}" "freeglut=${_realver}" "glut=${_realver}" "ati-dri=${_realver}")
replaces=('libgl' 'mesa' 'glut' 'freeglut' 'ati-dri' 'intel-dri' 'mach64-dri' 'mga-dri' 'r128-dri' 'savage-dri' 'tdfx-dri' 'unichrome-dri' 'mesa-full' 'xf86-video-ati-git' 'xf86-video-ati')
conflicts=('libgl' 'mesa' 'glut' 'freeglut' 'ati-dri' 'intel-dri' 'mach64-dri' 'mga-dri' 'r128-dri' 'savage-dri' 'tdfx-dri' 'unichrome-dri' 'mesa-full' 'xf86-video-ati-git' 'xf86-video-ati')
options=(!makeflags)
source=(xorg_tracker.patch)

_gitroot="git://anongit.freedesktop.org/git/mesa/mesa"
_gitname="mesa"

build() {
	msg "Connecting to git.freedesktop.org GIT server...."

	if [ -d $startdir/src/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf $startdir/src/$_gitname-build
	cp -rH $startdir/src/$_gitname $startdir/src/$_gitname-build

	cd $startdir/src/$_gitname-build
	./autogen.sh --prefix=/usr \
	--with-dri-driverdir=/usr/lib/xorg/modules/dri \
	--with-dri-drivers= \
	--enable-glx-tls \
	--disable-debug  \
	--enable-xcb \
	--with-state-trackers=dri,egl,glx,vega,xorg \
	--with-egl-platforms=x11 \
	--enable-gallium-radeon \
	--enable-gles1 \
	--enable-gles2

	patch -Np1 -i ${srcdir}/xorg_tracker.patch

	make || return 1
	make DESTDIR="${pkgdir}" install

	install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
	ln -sf libglx.xorg ${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so

	ln -sf r300_dri.so ${pkgdir}/usr/lib/xorg/modules/dri/radeon_dri.so
}
md5sums=('963a80164c010cf06101bc62eccb2c45')
