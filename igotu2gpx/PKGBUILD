# Maintainer: Weytsengtang
pkgname=igotu2gpx
pkgver=0.3.0
pkgrel=3
pkgdesc="Free GUI and command line utility to provide Linux/Mac OS X support for the MobileAction i-gotU USB GPS travel loggers"
url="https://launchpad.net/igotu2gpx"
depends=('qt4' 'boost' 'libusb' 'openssl')
optdepends=('marble: openstreetmap display of tracks')
makedepends=()
arch=('i686' 'x86_64' 'armv6h')
license=('GPL')
source=("http://launchpad.net/${pkgname}/${pkgver:0:3}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"
        90-libigotu2gpx.rules)
md5sums=('8de7427a7b35be00a08df346201f25bc'
         '55daed287571d90f4cbacf2546ec05a7')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  #### fix Debian/Ubuntu specific settings ####
  sed -e 's/boost_program_options-mt/boost_program_options/' -i ./localconfig-template.pri
  sed -e 's/boost_program_options-mt/boost_program_options/' -i ./clebs/external/boost-po.pri
  #### end fix Debian/Ubuntu specific settings ####

  #### enable explicit qt4 use ####
  sed -e 's/lrelease/lrelease-qt4/' -i ./igotu2gpx.pro
  ### end enable explicit qt4 use ####

  qmake-qt4 PREFIXDIR=/usr/ \
  TRANSLATIONDIR=/usr/share/${pkgname}/locale
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make INSTALL_ROOT=${pkgdir} install

  # Udev rules
  install -D -m644 "${srcdir}/90-libigotu2gpx.rules" "${pkgdir}/lib/udev/rules.d/90-libigotu2gpx.rules"
}
