# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=qmidicontrol
pkgver=0.0.1b
pkgrel=2
pkgdesc="A virtual MIDI fader box."
arch=('i686' 'x86_64')
url="http://alsamodular.sourceforge.net/"
license=('GPL')
depends=('alsa-lib' 'qt')
source=(http://downloads.sourceforge.net/sourceforge/alsamodular/${pkgname}-${pkgver}.tar.bz2)
md5sums=('3e00094daab6e6416c1cfe86a5e3a210')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  sed -i -e "s|QT_BASE_DIR=/usr/lib/qt3|QT_BASE_DIR=/opt/qt|" make_qmidicontrol
  make -f make_qmidicontrol
  install -Ds -m755 qmidicontrol ${startdir}/pkg/usr/bin/qmidicontrol
}
