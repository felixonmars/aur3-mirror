# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-sdk-qemu-gl
pkgver=0.12.4+git8+10d9982
pkgrel=1
_rpmver=1.1
pkgdesc='QEMU full system emulation binaries'
arch=('i686' 'x86_64')
url='http://meego.gitorious.org/meego-developer-tools/meego-emulator-qemugl-x86'
license=('GPL2')
depends=('libpng' 'libpulse' 'alsa-lib' 'sdl' 'mesa' 'libxcomposite')
source=("http://download.meego.com/live/Tools:/SDK:/Host/Trunk/src/qemu-gl-${pkgver}-${_rpmver}.src.rpm")
md5sums=('ab561d5872b01af8992e12d8ffa9e2c5')

build() {
  cd "${srcdir}"
  tar -zxf qemu-gl-${pkgver}.tar.gz

  cd qemu-gl-${pkgver}
  ./configure --with-pkgversion="MeeGo ${pkgver}" \
    --extra-cflags="${CFLAGS}" \
    --extra-ldflags="${LDFLAGS}" \
    --prefix=/opt/meego/qemu-gl \
    --disable-docs \
    --disable-strip \
    --disable-linux-user \
    --disable-bsd-user \
    --disable-darwin-user \
    --disable-werror \
    --target-list="i386-softmmu" \
    --audio-drv-list="alsa pa" \
    --audio-card-list="ac97" \
    --enable-kvm \
    --enable-gl \
    --enable-skinning
  make
}

package() {
  cd "${srcdir}"/qemu-gl-${pkgver}
  make DESTDIR="${pkgdir}" install

  # cleanup
  rm -f "${pkgdir}"/opt/meego/qemu-gl/bin/qemu-{img,io,nbd}
  rm -rf "${pkgdir}"/opt/meego/qemu-gl/share/{qemugl/openbios-*,doc,man}
}
