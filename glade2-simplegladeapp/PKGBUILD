# Contribuitor: Guillermo Garcia Ledezma |AhIoRoS| < ahioros@gmail.com >

pkgname=glade2-simplegladeapp
pkgver=2.12.1
pkgrel=1
pkgdesc="user interface builder for GTK+ and GNOME. with patch for tepache"
depends=('libgnomeui')
makedepends=('intltool')
url="http://glade.gnome.org/"
install=glade.install
source=(http://ftp.gnome.org/pub/GNOME/sources/glade/2.12/glade-$pkgver.tar.bz2\
        http://tigrux.nipl.net/python-glade/glade-2.10.0-simplegladepython.2.patch)
arch=('i686')
md5sums=('4e7a25dbd30b8c9dc2cf3c593776c444' 'e582b9cd0adafa7f97f0261c5eb215b0')


build() {
  cd $startdir/src/glade-$pkgver
  patch -Np1 -i ../glade-2.10.0-simplegladepython.2.patch || return 1
  find . -name Makefile.in -exec sed -i -e 's/-scrollkeeper-update.*//' {} \;
  if [ -f omf.make ]; then
    sed -i -e 's/-scrollkeeper-update.*//' omf.make
  fi

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
