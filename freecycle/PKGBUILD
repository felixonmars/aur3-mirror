# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Maciej Ciemborowicz <moonkey (at) op (dot) pl>
pkgname=freecycle
pkgver=0.6.1.1alpha
pkgrel=3
pkgdesc="A beat slicer running on GNU/Linux platform using the QT toolkit"
arch=('i686' 'x86_64')
url="http://freecycle.redsteamrecords.com/"
license=('GPL')
depends=('qt3' 'jack-audio-connection-kit' 'fftw' 'ladspa')
makedepends=('soundtouch>=1.3.0')
source=(http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('14e2318ce870ab6d9384feda32b6703d')

build() {
export QTDIR=/opt/qt
export QMAKESPEC=$QTDIR/mkspecs/linux-g++
export PATH=$QTDIR/bin:$PATH
export PKG_CONFIG_PATH=/opt/qt/lib/pkgconfig:$PKG_CONFIG_PATH

cd ${startdir}/src/${pkgname}
sed -i -e 's|^DEFINES += HAS_LIBINSTPATCH|#DEFINES += HAS_LIBINSTPATCH|' \
-e 's|^DEFINES += HAS_AUBIO|#DEFINES += HAS_AUBIO|' \
-e 's|^INCLUDEPATH += /opt/gnome/include/glib-2.0|#INCLUDEPATH += /opt/gnome/include/glib-2.0|' \
-e 's|^STATIC_GLIB_PATH=/opt/gnome/lib|STATIC_GLIB_PATH=/usr/lib|' \
src/cond.pri || return 1
sed -i -e 's|bufferPointersLR=new (float\*)|bufferPointersLR=new float\*|' \
src/soundplayer.cpp || return 1

qmake freecycle.pro || return 1
make || return 1

install -D -m755 bin/${pkgname} ${startdir}/pkg/usr/bin/${pkgname} || return 1
}
