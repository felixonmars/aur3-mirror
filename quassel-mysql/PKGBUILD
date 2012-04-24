# Contributor: Sarah Harvey <worldwise001@gmail.com>
pkgname='quassel-mysql'
pkgver=20110131
pkgrel=1
pkgdesc="QT4 IRC client with a separated core"
url="http://quassel-irc.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
provides=('quassel')
conflicts=('quassel')
install=quassel.install
backup=(etc/conf.d/quassel)
source=('http://gitorious.org/quassel/kode54s-quassel/archive-tarball/branch_mysql_support'
         'rc.quassel'
         'quassel.conf')
sha256sums=('74cd3735452044e4a0cb4d130781bd5b3f01732924a883af34e6a94f186174f1'
            '845e621448a51ec181554e9327bfcc3a3de1501ae8f70410f0b9b8991ac171b0'
            'f3031ea8217e01ba42cea14606169e3e27affa5918968ffd5a03c21ae92fe2b8')

build() {
    tar -xzf branch_mysql_support
    mv quassel-kode54s-quassel/* ${srcdir}/

    [[ ! -d build ]] && mkdir build
    cd build
    msg "Starting build process..."
    cmake \
      -DCMAKE_INSTALL_PREFIX=/usr/ \
      -DWITH_KDE=1 \
      -DCMAKE_BUILD_TYPE="Release" \
      ${srcdir}/ \
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
}

