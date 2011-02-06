# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=djplay
pkgver=0.5.0
pkgrel=2
pkgdesc="A live DJing system for the Jack sound server architecture"
arch=(i686)
url="http://djplay.sourceforge.net/"
license=('GPL')
depends=('glib' 'qt' 'libxml2' 'jack-audio-connection-kit' 'libdjconsole' \
         'id3lib' 'cdparanoia' 'libmad' 'libsamplerate' 'libvorbis' 'audiofile')
makedepends=('ladspa')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('ff13f542b13c2bcbdf1cf53bbcf0ebfc')

build() {
  # only compiles with qt3
  export QTDIR=/opt/qt
  export QMAKESPEC=$QTDIR/mkspecs/linux-g++
  export PATH=$QTDIR/bin:$PATH
  export PKG_CONFIG_PATH=/opt/qt/lib/pkgconfig:$PKG_CONFIG_PATH

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
