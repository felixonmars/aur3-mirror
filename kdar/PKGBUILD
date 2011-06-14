# Contributor:  Izaak Branderhorst <izaak@victoria.tc.ca>

pkgname=kdar
pkgver=2.1.0
pkgrel=2
pkgdesc="KDE Disk Archiver, a GUI to the libdar archiving/backup library"
url="http://kdar.sourceforge.net/"
arch=('i686' 'x86_64')
license="GPL"
depends=('dar' 'kdelibs3')
source=(http://downloads.sourceforge.net/kdar/$pkgname-$pkgver.tar.bz2)
md5sums=('7f52fb578ad1fa1fc14d80d34f91e2f2')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  . /etc/profile.d/qt3.sh
  export PATH=$QTDIR/bin:$PATH
  export QMAKESPEC=$QTDIR/mkspecs/linux-g++
  sed  -i -e 's|dar/libdar|&_4_4|g' -e 's|using namespace libdar|&_4_4|g' configure
  sed  -i -e 's|dar/libdar|&_4_4|g' -e 's|using namespace libdar|&_4_4|g' \
     -e 's|libdar::|libdar_4_4::|g' src/*
  sed -i -e 's|if ( QString( edition|&.display()|' src/archiveHandle.cpp
  ./configure --prefix=/opt/kde --enable-final --without-arts
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/opt/kde/share/doc/HTML/en/kdar/common"
}
