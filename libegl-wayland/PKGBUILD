# Maintainer: Nikita Skovoroda <chalkerx@gmail.com>
# Based on https://projects.archlinux.org/svntogit/packages.git/tree/mesa/trunk/PKGBUILD

pkgname=libegl-wayland
pkgdesc="Mesa EGL libraries and headers — version with Wayland platform support"
pkgrel=2

#_git=true
#_gitdate=20121006
_git=false

if [ "${_git}" = "true" ]; then
    pkgver=8.99.git_$_gitdate
  else
    pkgver=9.0.1
fi
#provides=('mesa-full-wayland' "libegl=$pkgver")
provides=("libegl=$pkgver")
arch=('i686' 'x86_64')
conflicts=('libegl')
depends=('libx11' 'libxext' 'libxdamage' 'libxfixes' 'libxxf86vm' 'libxcb' 'libgbm' 'khrplatform-devel')
makedepends=('glproto>=1.4.16' 'libdrm>=2.4.39' 'libxxf86vm>=1.1.2' 'libxdamage>=1.1.3' 'expat>=2.1.0' 'libx11>=1.5.0' 'libxt>=1.1.3' 
             'gcc-libs>=4.7.1-6' 'dri2proto>=2.8' 'python2' 'libxml2' 'imake' 'llvm' 'systemd' 'libvdpau>=0.5')
url="http://mesa3d.sourceforge.net"
license=('custom')
options=('!libtool')
source=('https://projects.archlinux.org/svntogit/packages.git/plain/mesa/trunk/LICENSE')
if [ "${_git}" = "true" ]; then
	# mesa git shot from 9.0 branch - see for state: http://cgit.freedesktop.org/mesa/mesa/log/?h=9.0
	#source=(${source[@]} 'ftp://ftp.archlinux.org/other/mesa/mesa-41d14eaf193c6b1eb87fe1998808a887f1c6c698.tar.gz')
	source=(${source[@]} "MesaLib-git${_gitdate}.zip"::"http://cgit.freedesktop.org/mesa/mesa/snapshot/mesa-7851d398def2df3f6836a500d67123eed50f3943.tar.gz")
  else
	source=(${source[@]} "ftp://ftp.freedesktop.org/pub/mesa/${pkgver}/MesaLib-${pkgver}.tar.bz2"
	#source=(${source[@]} "ftp://ftp.freedesktop.org/pub/mesa/8.0/MesaLib-8.0-rc2.tar.bz2"
)
fi
md5sums=('5c65a0fe315dd347e09b1f2826a1df5a'
         '97d6554c05ea7449398afe3a0ede7018')

build() {
    cd ${srcdir}/?esa-*

    COMMONOPTS="--prefix=/usr \
    --sysconfdir=/etc \
    --with-dri-driverdir=/usr/lib/xorg/modules/dri \
    --with-gallium-drivers=swrast \
    --with-dri-drivers=swrast \
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
    --enable-xa \
    --enable-vdpau "

# not default:
#    --with-egl-platforms=x11,drm,wayland       enable Wayland platform
#    --with-gallium-drivers=swrast              drivers are not needed for building libegl?
#    --with-dri-drivers=swrast                  drivers are not needed for building libegl?
#    --enable-gallium-egl enable optional EGL state tracker (not required for
#                          EGL support in Gallium with OpenGL and OpenGL ES)
#                          [default=disable]
#    --enable-xa             enable build of the XA X Acceleration API                          [default=no]


if [ "${_git}" = "true" ]; then
    ./autogen.sh \
      $COMMONOPTS
  else
    autoreconf -vfi
    ./configure \
      $COMMONOPTS
fi

    make
}

package() {
  # check also egl.pc
  
  make -C ${srcdir}/?esa-*/src/gallium/targets/egl-static DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/doc/libegl"
  install -m644 ${srcdir}/?esa-*/docs/egl.html "${pkgdir}/usr/share/doc/libegl/"
  
  # fix linking because of splitted package
  make -C ${srcdir}/?esa-*/src/mapi/shared-glapi DESTDIR="${pkgdir}" install
  make -C ${srcdir}/?esa-*/src/gbm DESTDIR="${pkgdir}" install
  
  make -C ${srcdir}/?esa-*/src/egl DESTDIR="${pkgdir}" install

  # fix linking because of splitted package - cleanup
  make -C ${srcdir}/?esa-*/src/gbm DESTDIR="${pkgdir}" uninstall
  make -C ${srcdir}/?esa-*/src/mapi/shared-glapi DESTDIR="${pkgdir}" uninstall

  install -m755 -d "${pkgdir}/usr/share/licenses/libegl"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/libegl/"
  
  # fix file conflicts
  rm -rf ${pkgdir}/usr/include/KHR
}
