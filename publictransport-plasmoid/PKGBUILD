# Maintainer: Carl Mueller  archlinux at carlm e4ward com

pkgname=publictransport-plasmoid
pkgver=0.10_rc2
_pkgver=0.10-rc2
pkgrel=1
pkgdesc="Kdeplasma widget with departure board for a given stop"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/PublicTransport?content=106175"
license=('GPL')
depends=('publictransport-library' 'kwebkitpart' 'kdebase-workspace')
makedepends=('git' 'cmake' 'automoc4' "publictransport-library=$pkgver")
options=()
build() {
  git archive --format=tar --remote=git://anongit.kde.org/publictransport unstable-$_pkgver > publictransport.tar
  cd $srcdir
  tar xf publictransport.tar
  cd engine
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
    make
    make DESTDIR="$pkgdir/" install
  cd ../applet
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
    make
    make DESTDIR="$pkgdir/" install
  cd ../applet-flights
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
    make
    make DESTDIR="$pkgdir/" install
  cd ../applet-graphicaltimetableline
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
    make
    make DESTDIR="$pkgdir/" install
  cd ../runner
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
    make
    make DESTDIR="$pkgdir/" install
  cd ../icons
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
    make
    make DESTDIR="$pkgdir/" install
  cd ../engine-openstreetmap
    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
    make
    make DESTDIR="$pkgdir/" install
#  cd ../timetablemate
#    cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
#    make
#    make DESTDIR="$pkgdir/" install
}
