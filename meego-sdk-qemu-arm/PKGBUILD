# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-sdk-qemu-arm
pkgver=0.13.50+git2+53d1915 
pkgrel=1
_rpmver=1.1
pkgdesc='QEMU full system emulation binaries'
arch=('i686' 'x86_64')
url='http://meego.gitorious.org/qemu-maemo/qemu'
license=('GPL2')
depends=('meego-sdk-gles-libs' 'libpng' 'sdl')
source=("http://download.meego.com/live/Tools:/SDK:/Host/Trunk/src/qemu-arm-${pkgver}-${_rpmver}.src.rpm")
md5sums=('5ef6bf92eb7f8519066dac5c87e31812')

build() {
  cd "${srcdir}"
  tar -zxf qemu-arm-${pkgver}.tar.gz

  cd qemu-arm-${pkgver}
  ./configure --with-pkgversion="MeeGo ${pkgver}" \
    --extra-cflags="${CFLAGS}" \
    --extra-ldflags="${LDFLAGS}" \
    --prefix=/opt/meego/qemu-arm \
    --disable-blobs \
    --disable-strip \
    --disable-linux-user \
    --disable-bsd-user \
    --disable-darwin-user \
    --disable-werror \
    --target-list="arm-softmmu i386-softmmu" \
    --audio-drv-list=sdl \
    --enable-gles2 \
    --gles2dir=/opt/meego/gles-libs \
    --enable-skinning
  make
}

package() {
  cd "${srcdir}"/qemu-arm-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm755 "${srcdir}"/debian.meego-sdk-qemu-system-arm.sh \
    "${pkgdir}"/opt/meego/qemu/bin/meego-sdk-qemu-system-arm
  DGLES2_LIB="/usr/lib/libGL.so.1"
  sed -i "s|@DGLES2_LIB@|$DGLES2_LIB|" \
    "${pkgdir}"/opt/meego/qemu/bin/meego-sdk-qemu-system-arm
  install -d "${pkgdir}"/usr/bin
  ln -sf /opt/meego/qemu/bin/meego-sdk-qemu-system-arm \
   "${pkgdir}"/usr/bin/
}