# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=midingsolo
pkgver=0.1.3
pkgrel=1
pkgdesc="A real-time audio note recognition software for monophonic signals"
arch=(i686)
url="http://home.gna.org/midingsolo/"
license=('GPL')
depends=('qt' 'jack-audio-connection-kit' 'freeglut')
source=(http://download.gna.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('dd9f166c4c858b10f289d3a498cc64ef')

build() {
  export QTDIR=/opt/qt
  export QMAKESPEC=$QTDIR/mkspecs/linux-g++
  export PATH=$QTDIR/bin:$PATH
  export PKG_CONFIG_PATH=/opt/qt/lib/pkgconfig:$PKG_CONFIG_PATH
	
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
