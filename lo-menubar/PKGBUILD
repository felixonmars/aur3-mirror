pkgname=lo-menubar
pkgbranch=trunk
pkgver=0.1.0
pkgrel=2
pkgdesc="Plugin for LibreOffice to export the menus to Appmenu"
arch=('i686' 'x86_64')
url="https://launchpad.net/lo-menubar"
license=('GPL')
depends=('libreoffice-common' 'dbus-glib' 'libdbusmenu')
makedepends=('libreoffice-sdk')
source=("http://launchpad.net/${pkgname}/${pkgbranch}/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2"
        "buildfix.patch")
md5sums=('2a06c73562c3bc21e2916ae1125a799f'
         'c99fe6d56f9d13a7e0c49f73b3a40975')

build() {
cd "${srcdir}/${pkgname}-${pkgver}"

patch -Np0 -i ${srcdir}/buildfix.patch

sed -i 's/python/python2/' waf
    unset CFLAGS
    unset CXXFLAGS
LD_LIBRARY_PATH=/usr/lib/libreoffice/ure/lib/ ./waf configure --ure-prefix=/usr/lib/libreoffice/ure/
./waf build
}

package() {
cd "${srcdir}/${pkgname}-${pkgver}"
./waf --destdir="${pkgdir}" install
}
