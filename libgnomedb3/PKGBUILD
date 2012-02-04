pkgname=libgnomedb3
pkgver=3.0.0
pkgrel=1
pkgdesc="libgnomedb provides data-bound UI widgets, using GTK+ and libgda"
arch=(i686 x86_64)
url="http://www.gnome-db.org/Download"
license=('GPL')
depends=('libgda3' 'gtk2>=2.6.0' 'libglade' 'libgnomeui' 'rarian')
makedepends=('intltool' 'pkgconfig')
options=('!libtool')
source=(http://ftp.acc.umu.se/pub/GNOME/sources/libgnomedb/3.0/libgnomedb-$pkgver.tar.bz2)
md5sums=('2a41abd14b123f0c9d4f540b9c07bedd')

build() {
  cd "$srcdir/libgnomedb-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$pkgdir install
}

