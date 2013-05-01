# Maintainer: Georges Discry <georges at discry dot be>

pkgbase=sunxi-mali-git
pkgname=sunxi-mali-git
true && pkgname=('sunxi-mali-libmali-git' 'sunxi-mali-libump-git' 'sunxi-mali-headers-git')
_gitname=sunxi-mali
pkgver=20.42f8ea4
pkgrel=1
pkgdesc="Mali implementation of OpenGL ES, OpenVG and EGL"
arch=('armv7h')
url="https://github.com/linux-sunxi/sunxi-mali"
license=('custom')
makedepends=('git' 'libdri2' 'libxfixes')
source=('git+https://github.com/linux-sunxi/sunxi-mali.git'
        'git+https://github.com/linux-sunxi/sunxi-mali-proprietary.git'
        'mali.conf')
md5sums=('SKIP'
         'SKIP'
         '4cf3405324ad2e47faa99c7d3cb6c735')

pkgver() {
  cd "${SRCDEST}/${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "${srcdir}/${_gitname}"
  rmdir lib/mali
  mv "${srcdir}/sunxi-mali-proprietary" lib/mali
  sed -i '/INSTALL_DATA/{p;:a;N;$!ba;d}' lib/mali/Makefile.mashup
  sed -i 's/INSTALL_DATA/INSTALL/' lib/mali/Makefile
  sed -i 's/-ldri2/-ldri2 -lpthread/' lib/ump/Makefile
  sed -i 's/INSTALL_DATA/INSTALL/' lib/ump/Makefile
}

build() {
  cd "${srcdir}/${_gitname}"
  make config VERSION=r3p0 ABI=armhf EGL_TYPE=x11
  make prefix=/usr/
}

package_sunxi-mali-headers-git() {
  arch=('any')
  cd "${srcdir}/${_gitname}"
  make -C include DESTDIR="${pkgdir}" prefix=/usr/ install_egl install_gles install_gles2 install_khr
}

package_sunxi-mali-libmali-git() {
  depends=('gcc-libs' 'libump')
  provides=('libmali')

  cd "${srcdir}/${_gitname}"
  install -m755 -d "${pkgdir}/usr/lib/mali"
  make -C lib/mali DESTDIR="${pkgdir}" prefix=/usr/ libdir='$(DESTDIR)$(prefix)/lib/mali/' install
  ln -s libMali.so "${pkgdir}/usr/lib/mali/libEGL.so.1.4"
  ln -s libEGL.so.1.4 "${pkgdir}/usr/lib/mali/libEGL.so.1"
  ln -s libEGL.so.1 "${pkgdir}/usr/lib/mali/libEGL.so"
  ln -s libMali.so "${pkgdir}/usr/lib/mali/libGLESv1_CM.so.1.1"
  ln -s libGLESv1_CM.so.1.1 "${pkgdir}/usr/lib/mali/libGLESv1_CM.so.1"
  ln -s libGLESv1_CM.so.1 "${pkgdir}/usr/lib/mali/libGLESv1_CM.so"
  ln -s libMali.so "${pkgdir}/usr/lib/mali/libGLESv2.so.2.0"
  ln -s libGLESv2.so.2.0 "${pkgdir}/usr/lib/mali/libGLESv2.so.2"
  ln -s libGLESv2.so.2 "${pkgdir}/usr/lib/mali/libGLESv2.so"
  install -m 755  -d "${pkgdir}/etc/ld.so.conf.d/"
  install -m 644 "${srcdir}/mali.conf" "${pkgdir}/etc/ld.so.conf.d/"
}

package_sunxi-mali-libump-git() {
  depends=('libdri2' 'libxfixes')
  provides=('libump')

  cd "${srcdir}/${_gitname}"
  install -m755 -d "${pkgdir}/usr/lib"
  make -C include DESTDIR="${pkgdir}" prefix=/usr/ install_ump
  make -C lib/ump DESTDIR="${pkgdir}" prefix=/usr/ install
}
