pkgname=('libgl-git-pselect')
pkgver=20100322
pkgrel=1
pkgdesc="Mesa 3-D graphics library and DRI software rasterizer from the git master branch with pselect support."
arch=(i686 x86_64)
license=('custom')
url="http://mesa3d.sourceforge.net"
depends=('libdrm-git' 'libxxf86vm>=1.1.0' 'libxdamage>=1.1.2' 'pselect-git')
makedepends=('dri2proto-git' 'glproto-git' 'pkgconfig' 'git' 'expat>=2.0.1' 'libx11>=1.3.2' 'libxt>=1.0.7' 'gcc-libs>=4.4.2' 'python')
conflicts=('libgl' 'libgl-git')
provides=('libgl=7.8' 'libgl-git')
install=libgl.install
options=(!makeflags)
source=('LICENSE'
        'mesa-7.1-link-shared.patch'
        'mesa-libgl.pselect')
md5sums=('5c65a0fe315dd347e09b1f2826a1df5a'
         '97bc4efc0a71c6dea0902e0ed787bf43'
         '9fe92bdf7cc53b093616e09c39df27bd')

_gitroot="git://anongit.freedesktop.org/git/mesa/mesa"
_gitname="mesa"

build() {
	cd $srcdir
	install -m755 -d ${pkgdir}/usr/share/pselect/modules
	install -m644 mesa-libgl.pselect ${pkgdir}/usr/share/pselect/modules/

	msg "Connecting to git.freedesktop.org GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf $srcdir/$_gitname-build
	git clone $srcdir/$_gitname $srcdir/$_gitname-build
	cd $srcdir/$_gitname-build

	patch -Np1 -i "${srcdir}/mesa-7.1-link-shared.patch" || return 1

	./autogen.sh --prefix=/usr \
		     --with-dri-driverdir=/usr/lib/xorg/modules/dri \
		     --with-dri-drivers=swrast \
		     --with-driver=dri \
		     --enable-glx-tls \
		     --enable-xcb \
		     --disable-gallium \
		     --disable-glut \
		     --disable-egl \
		     --disable-glu \
		     --disable-glw \
		     --disable-gallium-intel \
		     --disable-gallium-radeon || return 1

#       	     --enable-gallium-nouveau \
#     		     --enable-gallium-swrast \

	make || return 1

	install -m755 -d "${pkgdir}/usr/lib/" || return 1
	install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"

	bin/minstall lib/libGL.so.1.2 "${pkgdir}/usr/lib/" || return 1

	cd src/mesa/drivers/dri
	make -C swrast DESTDIR="${pkgdir}" install || return 1
	install -m755 libdricore.so "${pkgdir}/usr/lib/xorg/modules/dri/" || return 1

	install -m755 -d "${pkgdir}/usr/share/licenses/libgl"
	install -m755 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/libgl/" || return 1
}
