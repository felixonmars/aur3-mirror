# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=torium
pkgver=0.4.2
pkgrel=5
pkgdesc="Torium is a free, open source, minimalistic torrent client for Linux."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/torium/"
license=('ISC')
depends=('boost>=1.34' 'gtkmm>=2.4.0' 'libnotify' 'libtorrent-rasterbar>=0.13')
source=(http://sourceforge.net/projects/torium/files/torium/torium-$pkgver/torium-$pkgver.tar.gz
       'http://www.iconfinder.com/ajax/download/png/?id=30507&s=24')
md5sums=('fa1980cef7e248dbd82526f247541442'
         '6536094be5d9cf7d0eac16ea69a25476')


build() {
  cd $srcdir/$pkgname-$pkgver/src

  #Patches(Disable '-Wdeprecated-declarations' & 'Wwrite-strings' compile warnings, add boost/lexical_cast header file,
  # add 'C++ string classes' library, libnotify>0.4 fix(too many arguments), desktop icon for all desktops, correct URL Homepage)
  sed -i '1i#pragma GCC diagnostic ignored "-Wdeprecated-declarations -Wwrite-strings"' treeview.cc
  sed -i '2i#include <boost/lexical_cast.hpp>' treeview.cc
  sed -i '3i#include <string>' treeview.cc
  sed -i 's_"Torium", 0_"Torium"_' treeview.cc
  sed -i 's|http://bithack.se|http://sourceforge.net|' window.cc

  cd ..
  sed -i '/NotShowIn=KDE;/d' torium.desktop
  sed -i 's_GNOME;GTK;__' torium.desktop 
  sed -i 's_gtk-network_/usr/share/pixmaps/torium.png_' torium.desktop

  ./configure --prefix=/usr

  # Add libboost_system and libboost_filesystem to linker command
  sed -i 's|-lboost_thread| -lboost_thread -lboost_system -lboost_filesystem|' Makefile

  make DESTDIR=$pkgdir install

  # License ISC
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING

  # Desktop icon
  install -Dm644 $startdir/?id=30507* $pkgdir/usr/share/pixmaps/torium.png
}