#Maintainer: Muflone <muflone(at)vbsimple(dot)net>
#Contributor: John K. Luebs <jkluebs@luebsphoto.com>

pkgname=dkms-virtualbox
pkgver=4.1.22
pkgrel=1
pkgdesc="Kernel modules (DKMS) for VirtualBox"
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
depends=('dkms')
provides=("virtualbox-modules")
conflicts=("virtualbox-modules")
install=${pkgname}.install
makedepends=('libstdc++5' 'bin86' 'dev86' 'iasl' 'libxslt' 'libxml2' 'libpng' 'libidl2' 'xalan-c' 'sdl' 'linux-headers')
_kernver=$(pacman -Qi linux-headers | sed -ne 's/Version[ ]*:[ ]*// p' || true)-ARCH
[[ $CARCH == "x86_64" ]] && makedepends=("${makedepends[@]}" 'gcc-multilib' 'lib32-glibc')
options=(!strip)
source=(http://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}.tar.bz2
         LocalConfig.kmk dkms.conf)
sha1sums=('379ea8dadac1ea0d6eaa0db223794e80b68a1e6b'
          '881ee7b1252cd93a4837472fd9088648de3d5840'
          '772da8bb40a4f465a17e60efb4042931f2265975')

build() {
    cd "$srcdir/VirtualBox-${pkgver}"

    cp "$srcdir/LocalConfig.kmk" .

    sed -i "s#\`uname -m\`#${CARCH}#" configure
    ./configure \
        --with-linux=/usr/src/linux-${_kernver} \
        --disable-java \
        --disable-docs \
        --disable-xpcom \
        --disable-python \
        --disable-sdl-ttf \
        --disable-alsa \
        --disable-pulse \
        --disable-dbus  \
        --disable-opengl \
        --build-headless \
        --nofatal
    source ./env.sh
    kmk all
}

package() {
    source "$srcdir/VirtualBox-${pkgver}/env.sh"
    cd "$srcdir/VirtualBox-${pkgver}/out/linux.$BUILD_PLATFORM_ARCH/release/bin"

    mkdir -p "${pkgdir}/usr/src"
    cp -a src "${pkgdir}/usr/src/vboxhost-${pkgver}"
    cp ${srcdir}/dkms.conf "${pkgdir}/usr/src/vboxhost-${pkgver}"
}
