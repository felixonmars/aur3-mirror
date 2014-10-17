# Maintainer: Lara Maia <lara@craft.net.br>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=xvba-video
pkgver=0.8.0
pkgrel=1
pkgdesc="AMDs XvBA backend for VA-API, hardware video acceleration on RadeonHD cards"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/vaapi/"
depends=('catalyst>=10.12' 'libva')
makedepends=('xvba-sdk')
options=(!libtool)
license=('custom')
source=("http://cgit.freedesktop.org/vaapi/xvba-driver/snapshot/xvba-driver-$pkgver.tar.bz2"
        'xvba-video-0.8.0-assert-hw_image_hooks_glx.patch'
        'xvba-video-0.8.0-VAEncH264VUIBufferType.patch'
        'xvba-video-fix-mesa-gl.h.patch'
        'xvba-video-fix-out-of-source-builds.patch')

md5sums=('fed657f50abf09880b9bcb3901b301c0'
         '5dc283eab46418eeef8e8be7c028a2ba'
         '57e8720ee624d413aa358f2b03b7aa60'
         '1623587fa5fa0b19075e2efb549cd5ef'
         '5544a1b47a8766a35a40f10bfff8b651')

prepare() {
    cd "xvba-driver-$pkgver"

    # Patches
    patch -Np1 -i ../xvba-video-fix-mesa-gl.h.patch
    patch -Np0 -i ../xvba-video-fix-out-of-source-builds.patch
    patch -Np1 -i ../xvba-video-0.8.0-VAEncH264VUIBufferType.patch
    patch -Np1 -i ../xvba-video-0.8.0-assert-hw_image_hooks_glx.patch
    sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac || exit 1

    ./autogen.sh
}

build() {
    cd "xvba-driver-$pkgver"
    ./configure
    make PYTHON=python2
}

package() {
    cd "xvba-driver-$pkgver"

    make DESTDIR="$pkgdir" install

    # documentation
    install -dm644 "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 AUTHORS COPYING NEWS README "${pkgdir}/usr/share/doc/${pkgname}"
}
