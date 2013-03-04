# Contributer: giacomogiorgianni@gmail.com 

pkgname=qmetro
pkgver=0.6.5
pkgrel=3
pkgdesc="Qt Vector metro (subway) map for search routes and getting information. About 200 maps of subways are available"
arch=(i686 x86_64)
url="https://opendesktop.org/content/show.php/qMetro?content=146249"
license=('GPL')
depends=('qt4' 'zlib' 'libmodplug' 'unzip' 'qtmobility')
source=("http://heanet.dl.sourceforge.net/project/qmetro/source/$pkgname-$pkgver.zip")
makedepends=(make)
md5sums=('d16df7fffd240aa639a742272f077891')
install=$pkgname.install

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  qmake-qt4 $pkgname.pro -r -config release \
    "CONFIG+=LINUX_INTEGRATED" \
    "INSTALL_ROOT_PATH=$pkgdir/usr/" \
    "LOWERED_APPNAME=$pkgname"
 make clean && QMAKE=qmake-qt4 PREFIX=/usr
 sed -e '4s|QAudioOutput|qt4/QtMultimedia/QAudioOutput|' -i src/alarm/audiooutput.cpp
 sed -e '8s|QAudioOutput|qt4/QtMultimedia/QAudioOutput|' -i src/alarm/audiooutput.h
 sed -e '5s|QAudioDeviceInfo|qt4/QtMultimedia/QAudioDeviceInfo|' -i src/alarm/audiooutput.cpp
 
 sed -e '19s|-lpthread|-lpthread -lz|' -i Makefile
 make INSTALL_ROOT=${pkgdir} install
}

 