# Contributor: Rob McCathie <archaur at rmcc dot com dot au>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

#pkgbase=mesa9
pkgname=mesa9
true && pkgname=('mesa9' 'ati-dri-mesa9' 'intel-dri-mesa9' 'nouveau-dri-mesa9' 'svga-dri-mesa9' 'mesa9-libgl')

pkgver=9.2.5
pkgrel=3
arch=('i686' 'x86_64')
makedepends=('python2' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'libxxf86vm' 'libxdamage'
             'libvdpau' 'wayland' 'elfutils' 'llvm' 'systemd')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=("ftp://ftp.freedesktop.org/pub/mesa/${pkgver}/MesaLib-${pkgver}.tar.bz2"
        'LICENSE'
        '0001-llvm34_buildfix-undisable_prettystacktrace.patch'
        '0002-llvm34_buildfix-remove_targetoptions_realignstack.patch')
md5sums=('9fb4de29ca1d9cfd03cbdefa123ba336'
         '5c65a0fe315dd347e09b1f2826a1df5a'
         '32d040907369318bc8cc6d68663583d3'
         '5a44160b029d8c498cf5f1bd0b64a346')

prepare() {
  cd ${srcdir}/?esa-*
  # http://lists.freedesktop.org/archives/mesa-dev/2013-November/047625.html
  patch -Np1 -i "${srcdir}/0001-llvm34_buildfix-undisable_prettystacktrace.patch"
  # http://lists.freedesktop.org/archives/mesa-dev/2013-August/042849.html
  patch -Np1 -i "${srcdir}/0002-llvm34_buildfix-remove_targetoptions_realignstack.patch"
}

build() {
  cd ${srcdir}/?esa-*

  autoreconf -vfi # our automake is far too new for their build system :)

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-gallium-drivers=r300,r600,radeonsi,nouveau,svga,swrast \
    --with-dri-drivers=i915,i965,r200,radeon,nouveau,swrast \
    --with-egl-platforms=x11,drm,wayland \
    --with-llvm-shared-libs \
    --enable-gallium-llvm \
    --enable-egl \
    --enable-gallium-egl \
    --enable-shared-glapi \
    --enable-gbm \
    --enable-glx-tls \
    --enable-dri \
    --enable-glx \
    --enable-osmesa \
    --enable-gles1 \
    --enable-gles2 \
    --enable-texture-float \
    --enable-xa \
    --enable-vdpau \
    # --help

  make

  # fake installation
  mkdir $srcdir/fakeinstall
  make DESTDIR=${srcdir}/fakeinstall install
}

package_ati-dri-mesa9() {
  pkgdesc="Mesa drivers for AMD/ATI Radeon"
  depends=('mesa9-libgl' "mesa9=${pkgver}")
  optdepends=('libtxc_dxtn: S3 Texture Compressed support')
  conflicts=('xf86-video-ati<6.9.0-6' 'ati-dri')
  provides=("ati-dri=${pkgver}")

  install -m755 -d ${pkgdir}/usr/lib/vdpau/
  mv -v ${srcdir}/fakeinstall/usr/lib/vdpau/libvdpau_{r300,r600,radeonsi}.* ${pkgdir}/usr/lib/vdpau/

  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  mv -v ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/{r200,r300,r600,radeon,radeonsi}_dri.so ${pkgdir}/usr/lib/xorg/modules/dri/
  
  install -m755 -d ${pkgdir}/usr/lib/gallium-pipe
  mv -v ${srcdir}/fakeinstall/usr/lib/gallium-pipe/pipe_{r300,r600,radeonsi}* ${pkgdir}/usr/lib/gallium-pipe/
  
  install -m755 -d "${pkgdir}/usr/share/licenses/ati-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/ati-dri/"
}

package_intel-dri-mesa9() {
  pkgdesc="Mesa drivers for Intel"
  optdepends=('libtxc_dxtn: S3 Texture Compressed support')
  depends=('mesa9-libgl' "mesa9=${pkgver}")
  conflicts=('intel-dri')
  provides=("intel-dri=${pkgver}")

  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  mv -v ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/{i915,i965}_dri.so ${pkgdir}/usr/lib/xorg/modules/dri/

  install -m755 -d "${pkgdir}/usr/share/licenses/intel-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/intel-dri/"
}

package_nouveau-dri-mesa9() {
  pkgdesc="Mesa drivers for Nouveau"
  optdepends=('libtxc_dxtn: S3 Texture Compressed support')
  depends=('mesa9-libgl' "mesa9=${pkgver}")
  conflicts=('nouveau-dri')
  provides=("nouveau-dri=${pkgver}")

  install -m755 -d ${pkgdir}/usr/lib/vdpau/
  mv -v ${srcdir}/fakeinstall/usr/lib/vdpau/libvdpau_nouveau.* ${pkgdir}/usr/lib/vdpau/

  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  mv -v ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/nouveau_{dri,vieux_dri}.so ${pkgdir}/usr/lib/xorg/modules/dri/
  
  install -m755 -d ${pkgdir}/usr/lib/gallium-pipe
  mv -v ${srcdir}/fakeinstall/usr/lib/gallium-pipe/pipe_nouveau* ${pkgdir}/usr/lib/gallium-pipe/
  
  # vdpau drivers are still buggy with nouveau, so remove them (FS#36754)
  rm -rf ${pkgdir}/usr/lib/vdpau/

  install -m755 -d "${pkgdir}/usr/share/licenses/nouveau-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/nouveau-dri/"
}

package_svga-dri-mesa9() {
  pkgdesc="Gallium3D VMware guest GL driver"
  depends=('libdrm' 'expat' 'llvm-libs')
  conflicts=('svga-dri')
  provides=("svga-dri=${pkgver}")

  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  mv -v ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/vmwgfx_dri.so ${pkgdir}/usr/lib/xorg/modules/dri/

  install -m755 -d ${pkgdir}/usr/lib/gallium-pipe
  mv -v ${srcdir}/fakeinstall/usr/lib/gallium-pipe/pipe_vmwgfx* ${pkgdir}/usr/lib/gallium-pipe/
  
  install -m755 -d "${pkgdir}/usr/share/licenses/svga-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/svga-dri/"
}

package_mesa9() {
  pkgdesc="an open-source implementation of the OpenGL specification"
  depends=('libdrm' 'libvdpau' 'wayland' 'libxxf86vm' 'libxdamage' 'systemd' 'elfutils' 'llvm-libs')
  optdepends=('opengl-man-pages: for the OpenGL API man pages')
  provides=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel' "mesa=${pkgver}")
  conflicts=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel' 'mesa')
  replaces=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel')

  mv -v ${srcdir}/fakeinstall/* ${pkgdir}
  # rename libgl.so to not conflict with blobs - may break gl.pc ?
  mv ${pkgdir}/usr/lib/libGL.so.1.2.0 	${pkgdir}/usr/lib/mesa-libGL.so.1.2.0
  ln -s mesa-libGL.so.1.2.0 ${pkgdir}/usr/lib/mesa-libGL.so.1
  rm ${pkgdir}/usr/lib/libGL.so{,.1}

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"
}

package_mesa9-libgl() {
  pkgdesc="Mesa 3-D graphics library"
  depends=("mesa9=${pkgver}")
  provides=("mesa-libgl=${pkgver}" "libgl=${pkgver}")
  conflicts=('mesa-libgl')
  replaces=('libgl')
 
  # See FS#26284
  install -m755 -d "${pkgdir}/usr/lib/xorg/modules/extensions"
  ln -s libglx.xorg "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so"

  ln -s mesa-libGL.so.1.2.0      ${pkgdir}/usr/lib/libGL.so
  ln -s mesa-libGL.so.1.2.0      ${pkgdir}/usr/lib/libGL.so.1
  ln -s mesa-libGL.so.1.2.0      ${pkgdir}/usr/lib/libGL.so.1.2.0

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa-libgl"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa-libgl/"
}

pkgdesc="an open-source implementation of the OpenGL specification"
