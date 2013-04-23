# Contributer: graysky <graysky AT archlinux DOT us
# Contributer: CEPfister
# Contributer: Jan de Groot <jgc@archlinux.org>
# Contributer: Andreas Radke <andyrtr@archlinux.org>

pkgname=mesa-i915g
true && pkgname=('mesa-i915g' 'intel-dri-i915g' 'mesa-libgl-i915g')
_pkgname=mesa
pkgver=snb.magic.15642.g85974e5
_realver=9.1.1
pkgrel=1
pkgdesc='Mesa 3D graphics library with all its components, built from the git master branch. Compiles mesa for i915g (gallium).'
arch=('i686' 'x86_64')
url="http://mesa3d.org/"
license=('LGPL')
depends=('libdrm-git' 'dri2proto>=2.1' 'glproto>=1.4.10' 'libxxf86vm' 'libxdamage' 'expat>=2.0.1' 'libxmu' 'talloc' 'llvm' 'glu')
makedepends=('pkgconfig' 'imake' 'xorg-server-devel')
source=('git://anongit.freedesktop.org/git/mesa/mesa'
'LICENSE')
sha256sums=('SKIP'
            'd2b79a38f1c0b6da189d5698e38002e2f944cde0270565425cf251e674d7502d')

pkgver() {
	cd "$_pkgname"
	git describe --always | sed 's|-|.|g'
}

build() {
	cd "$_pkgname"
	./autogen.sh --prefix=/usr \
		--sysconfdir=/etc \
		--with-dri-driverdir=/usr/lib/xorg/modules/dri \
		--with-gallium-drivers=i915,swrast \
		--with-dri-drivers=i915,swrast \
		--enable-gallium-llvm \
		--enable-egl \
		--enable-gallium-egl \
		--with-egl-platforms=x11,drm,wayland \
		--enable-shared-glapi \
		--enable-gbm \
		--enable-glx-tls \
		--enable-dri \
		--enable-glx \
		--enable-osmesa \
		--enable-gles1 \
		--enable-gles2 \
		--enable-texture-float \
		--enable-xa 

	make

	# fake installation
	mkdir $srcdir/fakeinstall
	make DESTDIR=${srcdir}/fakeinstall install
}

package_intel-dri-i915g() {
pkgdesc="Mesa drivers for Intel i915g (gallium). Git version."
depends=("mesa-libgl-i915g")
conflicts=('intel-dri' 'mesa-full' 'mesa-full-i915' 'mesa-full-i965' 'mesa-full-i915g')
provides=('intel-dri')

cd "$_pkgname"
install -dm755 ${pkgdir}/usr/lib/xorg/modules/dri
install -m755 ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/i915_dri.so ${pkgdir}/usr/lib/xorg/modules/dri/i915_dri.so
install -dm755 "${pkgdir}/usr/share/licenses/intel-dri"
install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/intel-dri/"
}

package_mesa-i915g() {
pkgdesc="An open-source implementation of the OpenGL specification. Git version."
depends=('libdrm' 'libvdpau' 'wayland' 'libxxf86vm' 'libxdamage' 'systemd')
optdepends=('opengl-man-pages: for the OpenGL API man pages')
replaces=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel')
conflicts=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel' 'mesa' 'mesa-full' 'mesa-full-i915' 'mesa-full-i965' 'mesa-full-i915g')
provides=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel' "mesa=$_realver")

cd "$_pkgname"
cp -a ${srcdir}/fakeinstall/* ${pkgdir}

# rename libgl.so to not conflict with blobs - may break gl.pc ?
mv ${pkgdir}/usr/lib/libGL.so.1.2.0 	${pkgdir}/usr/lib/mesa-libGL.so.1.2.0
rm ${pkgdir}/usr/lib/libGL.so{,.1}

# since the intel-dri-g package provides this, remove it from this package to avoid a conflict
rm ${pkgdir}/usr/lib/xorg/modules/dri/i915_dri.so
install -dm755 "${pkgdir}/usr/share/licenses/mesa"
install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"
}

package_mesa-libgl-i915g() {
pkgdesc="Mesa 3-D graphics library. Git version."
depends=('mesa-i915g')
replaces=('libgl')
conflicts=('mesa-libgl' 'mesa-full' 'mesa-full-i915' 'mesa-full-i965' 'mesa-full-i915g')
provides=("libgl=$_realver" "mesa-libgl")

cd "$_pkgname"

# See FS#26284
install -dm755 "${pkgdir}/usr/lib/xorg/modules/extensions"
ln -s libglx.xorg "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"

ln -s mesa-libGL.so.1.2.0      ${pkgdir}/usr/lib/libGL.so
ln -s mesa-libGL.so.1.2.0      ${pkgdir}/usr/lib/libGL.so.1
ln -s mesa-libGL.so.1.2.0      ${pkgdir}/usr/lib/libGL.so.1.2.0

install -dm755 "${pkgdir}/usr/share/licenses/mesa-libgl"
install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa-libgl/"
}
pkgdesc='Mesa 3D graphics library with all its components, built from the git master branch. Compiles mesa for i915g (gallium).'
