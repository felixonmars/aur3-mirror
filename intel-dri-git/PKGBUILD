# Maintainer: Josh Marshall <jrmarsha@mtu.edu>
# Maintainer: Tavian Barnes <tavianator@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Antti "Tera" Oja <antti.bofh@gmail.com>


pkgbase=intel-dri-git
pkgname=intel-dri-git
true && pkgname=('intel-dri-git' 'mesa-git' 'mesa-libgl-git')
_gitname=mesa
provides=('intel-dri' 'mesa')
pkgrel=0
#pkgrel(){
#	cd $_gitname
#	echo $(git rev-list --count HEAD)
#}
#pkgver() {
#  date +%Y%m%d
#}
pkgver=9.2.0
#pkgver=$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
#pkgver=$(date +%Y%m%d)
pkgdesc="A mesa build using the current git repo optimized for running intel graphics only."
arch=(i686 x86_64)
depends=('libdrm' 'dri2proto' 'xorg-server')
makedepends=('git' 'libdrm' 'wayland' 'libx11' 'dri2proto' 'libxxf86vm' \
	'libxdamage' 'libvdpau' 'systemd' 'llvm>=3.3' 'python' 'libxml2' 'flex' 'bison' 'imake' 'libtool' 'gcc' 'xorg-server-devel' 'libx11' 'libxrender' 'resourceproto' 'libxvmc' 'xorg-server' 'glproto' 'libxdamage' 'pkg-config' 'systemd' 'elfutils' 'pacman>=4.1' 'llvm-libs' 'expat')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=(LICENSE
				'git://anongit.freedesktop.org/git/mesa/mesa')
md5sums=('5c65a0fe315dd347e09b1f2826a1df5a'
					'SKIP')


build() {
  
  cd $_gitname

  ./autogen.sh \
	--disable-gallium-llvm \
	--enable-dri \
	--enable-egl \
	--enable-gbm \
	--enable-glx \
	--enable-glx-tls \
	--enable-osmesa \
	--enable-subdir-objects \
	--enable-texture-float \
	--enable-vdpau \
	--prefix=/usr \
	--sysconfdir=/etc \
	--with-dri-drivers=i915,i965 \
	--with-gallium-drivers= \
	--with-egl-platforms=x11,drm,wayland 
	#	--with-llvm-shared-libs 
	#	--enable-gles1 \
	#	--enable-shared-glapi \
	# --enable-xa \
	# --enable-gles2 \

  make -j5

}


package_mesa-git() {
  pkgdesc="an open-source implementation of the OpenGL specification"
  depends=('libdrm' 'libvdpau' 'wayland' 'libxxf86vm' 'libxdamage' 'systemd')
  optdepends=('opengl-man-pages: for the OpenGL API man pages')
  provides=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl')
  conflicts=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl')
  replaces=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl')

#  mv -v $_gitname/fakeinstall/* ${pkgdir}
#  mv ${pkgdir}/usr/lib/libGL.so.1.2.0 	${pkgdir}/usr/lib/mesa-libGL.so.1.2.0
#  rm ${pkgdir}/usr/lib/libGL.so{,.1}

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"
}

package_mesa-libgl-git() {
  pkgdesc="Mesa 3-D graphics library"
  depends=("mesa=${pkgver}")
  provides=("libgl=${pkgver}" 'mesa-libgl=$pkgver')
  replaces=('libgl')
 
  install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
  ln -s libglx.xorg "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"

  ln -s mesa-libGL.so.1.2.0      ${pkgdir}/usr/lib/libGL.so
  ln -s mesa-libGL.so.1.2.0      ${pkgdir}/usr/lib/libGL.so.1
  ln -s mesa-libGL.so.1.2.0      ${pkgdir}/usr/lib/libGL.so.1.2.0

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa-libgl"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa-libgl/"
}


package_intel-dri-git() {
  pkgdesc="Mesa drivers for Intel"
  depends=("mesa-libgl=${pkgver}")

#  mv -v $_gitname/fakeinstall/usr/lib/xorg/modules/dri/{i915,i965}_dri.so ${pkgdir}/usr/lib/xorg/modules/dri/
  install -m755 -d "${pkgdir}/usr/lib/xorg/modules/dri"

  install -m755 -d "${pkgdir}/usr/share/licenses/intel-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/intel-dri/"
}
