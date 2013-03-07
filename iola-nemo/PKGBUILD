# Contributor: Dejan Čabrilo <dcabrilo@gmail.com>
pkgname=iola-nemo
_pkgname=nemo
pkgver=0.2.4
pkgrel=1
pkgdesc="A label and calendar-based file manager."
arch=('any')
url="http://www.iola.dk/nemo/"
license=('LGPL')
depends=('libgnome-sharp' 'gnome-vfs-sharp' 'ndesk-dbus-glib' 'tracker')
conflicts=('nemo')
source=("http://www.iola.dk/nemo/downloads/$_pkgname-$pkgver.tar.bz2")
md5sums=('8d1773e299f6bcd391696279b3262719')

build() {
  cd $srcdir/$_pkgname-$pkgver

  # Makefile in po/ specifies wrong full path to install
  sed -i -e 's/\/usr\/bin\/install/install/' po/Makefile
  sed -i -e 's/\/usr\/lib\/cli\/ndesk/\/usr\/lib\/mono\/ndesk/g' Makefile

  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  make DESTDIR=$pkgdir install

  # Let's move nemo.exe to /usr/lib/nemo/bin because it is
  #   useless to us in /usr/bin (can't and shouldn't be executed without 
  #   the wrapper script, so no place in PATH)
  mkdir -p $pkgdir/usr/lib/$_pkgname
  mv -v $pkgdir/usr/bin/nemo.exe $pkgdir/usr/lib/$_pkgname/nemo.exe
  sed -i 's/bin\/nemo.exe/lib\/nemo\/nemo.exe/' $pkgdir/usr/bin/nemo
}
