# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-sdk-gles-libs
pkgver=1.3.0+git22+82ab79d
pkgrel=2
_rpmver=1.6
pkgdesc='QEMU OpenGL ES 2.0 accelerator'
arch=('i686' 'x86_64')
url='http://meego.gitorious.org/qemu-maemo/gles-libs'
license=('MIT' 'GPL2')
depends=('libgl')
source=("http://download.meego.com/live/Tools:/SDK:/Host/Trunk/src/gles-libs-${pkgver}-${_rpmver}.src.rpm")
md5sums=('94795079c897939585aae91000bf9ef0')

build() {
  cd "${srcdir}"
  tar -zxf gles-libs-${pkgver}.tar.gz

  cd gles-libs-${pkgver}/dgles2
  ./configure --prefix=/opt/meego/gles-libs \
    --enable-osmesa \
    --enable-offscreen \
    --enable-glx \
    --enable-x11
  make
}

package() {
  cd "${srcdir}"/gles-libs-${pkgver}/dgles2
  make I="${pkgdir}"/opt/meego/gles-libs install
  
  # cleanup
  rm -rf "${pkgdir}"/opt/meego/gles-libs/lib/pkgconfig
}
