# Maintainer: Jochen Schalanda <jochen+aur (-at-) schalanda.name>
pkgname=quasselcore
pkgver=0.9.0
pkgrel=2
pkgdesc="Qt4 IRC client with a separated core - core only"
url="http://quassel-irc.org"
arch=('i686' 'x86_64' 'armv6h')
license=('GPL')
depends=('qt4')
conflicts=('quassel')
makedepends=('cmake' 'automoc4')
source=("${url}/pub/quassel-${pkgver}.tar.bz2"
	'rc.quassel'
	'quassel.service'
        'quassel.conf')
install=quassel.install
backup=(etc/conf.d/quassel.conf)

build() {
  [[ ! -d build ]] && mkdir build
  cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr/ \
    -DWITH_OPENSSL=ON \
    -DWANT_CORE=ON \
    -DWANT_MONO=OFF \
    -DWANT_QTCLIENT=OFF \
    -DWITH_DBUS=OFF \
    -DWITH_OXYGEN=OFF \
    -DWITH_PHONON=OFF \
    -DWITH_WEBKIT=OFF \
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
  install -D ${srcdir}/quassel.service \
    ${pkgdir}/usr/lib/systemd/system/quassel.service
}
md5sums=('29b843f18d703abfadb8fc729ca1df11'
         '91e414cb313430a2360f1a594b1d6ed3'
         '1d38c13a68b03c603d29602dce738b5c'
         '479229556ba0dd94e3ce28e31e5deea9')
