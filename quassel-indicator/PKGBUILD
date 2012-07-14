# Maintainer: Zom Aur <zom[at]eevul[dot]org>

pkgname=quassel-indicator
pkgver=0.8.0
pkgrel=2
pkgdesc="Qt4 IRC client with a separate core, with added indicator patches from kubuntu"
url="http://quassel-irc.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs' 'oxygen-icons' 'hicolor-icon-theme' 'libindicate-qt')
makedepends=('cmake' 'automoc4')
provides=('quassel' 'quasselcore' 'quasselclient')
conflicts=('quassel' 'quasselcore' 'quasselclient')
source=("${url}/pub/quassel-${pkgver}.tar.bz2"
        "kubuntu_02_enable_message_indicator.diff"
        "rc.quassel"
        "quassel.conf"
        "quassel.service")
install=quassel.install
sha256sums=('a3515bd18e2b100eb9a72480e76b1faefaa5e84cdb236b6af1f05b477a1e9071'
            '47e69833c74957d19d6665605026e52e64f57e07e357afd15abc386c7bb05516'
            '845e621448a51ec181554e9327bfcc3a3de1501ae8f70410f0b9b8991ac171b0'
            'f3031ea8217e01ba42cea14606169e3e27affa5918968ffd5a03c21ae92fe2b8'
            '2a6f4a5f9b543a9338d94f053af1c60bfb1e95bd428d59ad15094da0a50b90ce')

build() {
  cd ${srcdir}/quassel-${pkgver}
  patch -p1 <../kubuntu_02_enable_message_indicator.diff

  cd ${srcdir}
  [[ ! -d build ]] && mkdir build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DWITH_KDE=1 \
    -DWITH_OPENSSL=ON \
    -DWITH_LIBINDICATE=ON \
    -DCMAKE_BUILD_TYPE="Release" \
    ../quassel-${pkgver}/ \
    -Wno-dev

  make
}

package() {
  cd build

  make DESTDIR=${pkgdir} install

  install -D ${srcdir}/rc.quassel \
    ${pkgdir}/etc/rc.d/quassel
  install -D -m644 ${srcdir}/quassel.conf \
    ${pkgdir}/etc/conf.d/quassel
  install -D -m644 ${srcdir}/quassel.service \
    ${pkgdir}/usr/lib/systemd/system/quassel.service
}
