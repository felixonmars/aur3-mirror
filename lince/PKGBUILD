

pkgname=lince
pkgver=1.3
pkgrel=2
pkgdesc="Bittorrent client using libtorrent-rasterbar library and gtkmm for the interface"
arch=('i686' 'x86_64')
url="http://lincetorrent.sourceforge.net/"
license=('GPL3')
depends=('boost>=1.36' 'gtkmm3' 'libnotify' 'libtorrent-rasterbar>=0.15.5' 'python2')
makedepends=('intltool>=0.35.0')
options=(!libtool)
source=(http://downloads.sourceforge.net/lincetorrent/$pkgname-$pkgver.tar.gz)
md5sums=('878d7d8868eeca719cfb0d6c43880d6b')


build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr LIBS="-lcrypto -lpthread"
  
  # Build
  make
  make DESTDIR=$pkgdir install

  # Python2 fix
  cd $pkgdir/usr/share/lince/search_engine
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' nova2* engines/btdigg.py

  # Remove garbage
  rm -rf $pkgdir/usr/include
}