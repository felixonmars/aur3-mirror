# Contributor: refujee <refujee@gmail.com>
pkgname=g15terminal
pkgver=0.1
pkgrel=1
pkgdesc="Using the Rote library, this project aims to bring a usable terminal to the LCD screens on G15 keyboards."
arch=(i686 x86_64)
url="http://www.g15tools.com/forum/viewtopic.php?f=12&t=150&sid=930707d9254775e2dbbe58270bd3edba"
license=('GPL')
depends=(libx11 libg15render g15daemon rote)
source=(http://g15terminal.googlecode.com/files/g15terminal.tar.gz)
md5sums=('e8c647ba68387033cd51944c73318e9b')

build() {
  cd $startdir/src/$pkgname
  LDFLAGS="-lg15daemon_client -lg15render -lpthread -lX11 -lrote" CXXFLAGS="-Wno-write-strings"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --disable-static

   make || return 1
   make DESTDIR=${pkgdir} install || return 1

}

