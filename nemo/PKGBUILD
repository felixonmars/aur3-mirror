# Contributor: Dejan Čabrilo <dcabrilo@gmail.com>
pkgname=nemo
pkgver=0.2.4
pkgrel=1
pkgdesc="A label and calendar-based file manager."
arch=('i686' 'x86_64')
url="http://www.iola.dk/nemo/"
license=('LGPL')
depends=('mono' 'gtk-sharp-2' 'gnome-sharp' 'ndesk-dbus')
makedepends=('ndesk-dbus-glib')
optdepends=('tracker: one of two indexing backends supported by nemo, install at least one!' 'beagle: one of two indexing backends supported by nemo, install at least one!')
source=("http://www.iola.dk/nemo/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('8d1773e299f6bcd391696279b3262719')

build() {
  cd $startdir/src/$pkgname-$pkgver

  # Makefile in po/ specifies wrong full path to install
  sed -i -e 's/\/usr\/bin\/install/install/' po/Makefile
  sed -i -e 's/\/usr\/lib\/cli\/ndesk/\/usr\/lib\/mono\/ndesk/g' Makefile
  MONO_SHARED_DIR=$startdir/src/ make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  # Let's move nemo.exe to /usr/lib/nemo/bin because it is
  #   useless to us in /usr/bin (can't and shouldn't be executed without 
  #   the wrapper script, so no place in PATH)
  mkdir -pv $startdir/pkg/usr/lib/$pkgname/bin
  mv -v $startdir/pkg/usr/bin/nemo.exe $startdir/pkg/usr/lib/$pkgname/bin/nemo.exe
  sed -i -e 's/bin\/nemo.exe/lib\/nemo\/\0/' $startdir/pkg/usr/bin/nemo
}
