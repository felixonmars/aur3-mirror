# Original contributor: Alexander Fehr <pizzapunk gmail com>
# ---
# Latest maintainer: Neil Santos <nsantos+aur@gmail.com>

pkgname=gtk-server
pkgver=2.3.1
pkgrel=4
pkgdesc='Stream-oriented interface to the GTK+ libraries'
arch=('i686' 'x86_64')
url="http://www.gtk-server.org/"
license=('GPL')
depends=('gtk2>=2.14' 'libffi')
makedepends=('pkgconfig' 'glade')
backup=('etc/gtk-server.cfg')
source=("http://downloads.sourceforge.net/gtk-server/gtk-server-$pkgver-sr.tar.gz"
        'http://www.gtk-server.org/gtk-server.cfg')
md5sums=('fd5cc04fb6cce5312b119f5b0c6b4ae6'
         '4a72419de37a1cd4ac42055cd2dce801')

build() {
  cd "$srcdir/gtk-server-$pkgver-sr"
  cp "$srcdir/gtk-server.cfg" "$srcdir/gtk-server-$pkgver-sr/"

  export CPPFLAGS=`pkg-config --cflags libffi`
  export LDFLAGS=`pkg-config --libs libglade-2.0`

  ./configure --prefix=/usr --sysconfdir=/etc --with-gtk2 || return 1
  make || return 1
  make prefix=$startdir/pkg/usr SYSCONFIG=$startdir/pkg/etc install || return 1

  ./configure --prefix=/usr --sysconfdir=/etc --enable-library --with-gtk2 || return 1
  make || return 1
  install -D -m755 libgtk-server.so "$pkgdir/usr/lib/libgtk-server.so" || return 1
  install -m644 libgtk-server.a "$pkgdir/usr/lib" || return 1
}
