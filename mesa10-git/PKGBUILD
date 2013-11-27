# $Id: PKGBUILD 199796 2013-11-16 15:01:33Z thomas $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Alain Kalker <a.c.kalker@gmail.com>

pkgbase=mesa10-git
pkgname=mesa10-git
# Workaround for AUR website not supporting split packages
true && pkgname=('ati-dri-git' 'intel-dri-git' 'nouveau-dri-git' 'svga-dri-git' 'mesa10-git' 'mesa-libgl-git')
pkgver=10.0.rc2.59696
pkgrel=1
_branch=10.0
pkgdesc="Mesa 3-D graphics library (10.x development branch)"
arch=('i686' 'x86_64')
makedepends=('python2' 'libxml2' 'libx11' 'glproto' 'libdrm' 'dri2proto' 'libxxf86vm' 'libxdamage'
             'libvdpau' 'wayland' 'elfutils' 'llvm' 'systemd')
url="http://mesa3d.sourceforge.net"
license=('custom')
source=(git://anongit.freedesktop.org/mesa/mesa#branch=${_branch}
        LICENSE)
md5sums=('SKIP'
         '5c65a0fe315dd347e09b1f2826a1df5a')

pkgver() {
  cd ${srcdir}/mesa

  echo $(git describe | sed 's/mesa-//; s/-/./g').$(git rev-list --count HEAD)
}

build() {
  cd ${srcdir}/mesa

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

package_ati-dri-git() {
  pkgdesc="Mesa drivers for AMD/ATI Radeon"
  depends=('mesa-libgl' "mesa=${pkgver}")
  optdepends=('libtxc_dxtn: S3 Texture Compressed support')
  conflicts=('ati-dri' 'xf86-video-ati<6.9.0-6')
  provides=('ati-dri')

  install -m755 -d ${pkgdir}/usr/lib/vdpau/
  mv -v ${srcdir}/fakeinstall/usr/lib/vdpau/libvdpau_{r600,radeonsi}.* ${pkgdir}/usr/lib/vdpau/

  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  mv -v ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/{r200,r300,r600,radeon,radeonsi}_dri.so ${pkgdir}/usr/lib/xorg/modules/dri/
  
  install -m755 -d ${pkgdir}/usr/lib/gallium-pipe
  mv -v ${srcdir}/fakeinstall/usr/lib/gallium-pipe/pipe_{r300,r600,radeonsi}* ${pkgdir}/usr/lib/gallium-pipe/
  
  install -m755 -d "${pkgdir}/usr/share/licenses/ati-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/ati-dri/"
}

package_intel-dri-git() {
  pkgdesc="Mesa drivers for Intel"
  optdepends=('libtxc_dxtn: S3 Texture Compressed support')
  depends=('mesa-libgl' "mesa=${pkgver}")
  conflicts=('intel-dri')
  provides=('intel-dri')

  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  mv -v ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/{i915,i965}_dri.so ${pkgdir}/usr/lib/xorg/modules/dri/

  install -m755 -d "${pkgdir}/usr/share/licenses/intel-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/intel-dri/"
}

package_nouveau-dri-git() {
  pkgdesc="Mesa drivers for Nouveau"
  optdepends=('libtxc_dxtn: S3 Texture Compressed support')
  depends=('mesa-libgl' "mesa=${pkgver}")
  conflicts=('nouveau-dri')
  provides=('nouveau-dri')

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

package_svga-dri-git() {
  pkgdesc="Gallium3D VMware guest GL driver"
  depends=('libdrm' 'expat' 'llvm-libs')
  conflicts=('svga-dri')
  provides=('svga-dri')

  install -m755 -d ${pkgdir}/usr/lib/xorg/modules/dri
  mv -v ${srcdir}/fakeinstall/usr/lib/xorg/modules/dri/vmwgfx_dri.so ${pkgdir}/usr/lib/xorg/modules/dri/

  install -m755 -d ${pkgdir}/usr/lib/gallium-pipe
  mv -v ${srcdir}/fakeinstall/usr/lib/gallium-pipe/pipe_vmwgfx* ${pkgdir}/usr/lib/gallium-pipe/
  
  install -m755 -d "${pkgdir}/usr/share/licenses/svga-dri"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/svga-dri/"
}

package_mesa10-git() {
  pkgdesc="an open-source implementation of the OpenGL specification"
  depends=('libdrm' 'libvdpau' 'wayland' 'libxxf86vm' 'libxdamage' 'systemd' 'elfutils' 'llvm-libs')
  optdepends=('opengl-man-pages: for the OpenGL API man pages')
  provides=("mesa=${pkgver}" 'libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel')
  conflicts=('mesa' 'mesa-git' 'libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel')
  replaces=('libglapi' 'osmesa' 'libgbm' 'libgles' 'libegl' 'khrplatform-devel')

  mv -v ${srcdir}/fakeinstall/* ${pkgdir}
  # rename libgl.so to not conflict with blobs - may break gl.pc ?
  mv ${pkgdir}/usr/lib/libGL.so.1.2.0 	${pkgdir}/usr/lib/mesa-libGL.so.1.2.0
  ln -s mesa-libGL.so.1.2.0 ${pkgdir}/usr/lib/mesa-libGL.so.1
  rm ${pkgdir}/usr/lib/libGL.so{,.1}

  install -m755 -d "${pkgdir}/usr/share/licenses/mesa"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/mesa/"
}

package_mesa-libgl-git() {
  pkgdesc="Mesa 3-D graphics library"
  depends=("mesa=${pkgver}")
  conflicts=('mesa-libgl')
  provides=('mesa-libgl' "libgl=${pkgver}")
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
