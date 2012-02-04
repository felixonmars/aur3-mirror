# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=qjacklam
pkgver=0.3
pkgrel=1
pkgdesc="A latency meter for JACK"
arch=(i686)
url="http://developer.berlios.de/projects/qjacklam/"
license=('GPL')
depends=('qt' 'jack-audio-connection-kit')
source=(http://download.berlios.de/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('975d453ffd52182ad9ce398b58387e2b')

build() {
  export QTDIR=/opt/qt
  export QMAKESPEC=$QTDIR/mkspecs/linux-g++
  export PATH=$QTDIR/bin:$PATH
  export PKG_CONFIG_PATH=/opt/qt/lib/pkgconfig:$PKG_CONFIG_PATH
	
  cd ${startdir}/src/${pkgname}
  sed -i -e 's|^TARGET=\.\./bin/qjacklam|TARGET=qjacklam|' src.pro
  qmake -o Makefile src.pro || return 1
  make || return 1
  install -D -m755 ${pkgname} ${startdir}/pkg/usr/bin/${pkgname}
}
