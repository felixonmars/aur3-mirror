# Contributor: Eduard "bekks" Warkentin <eduard.warkentin@gmail.com>
pkgname=hk_classes
pkgver=0.8.3
pkgrel=4
pkgdesc="supporting libraries for knoda"
arch=('i686' 'x86_64')
url="http://hk-classes.sourceforge.net"
license=('GPL')
depends=('libmysqlclient' 'postgresql-libs' 'fontconfig' 'unixodbc' 'libxml2' 'python' 'glib2')
makedepends=('sqlite3' 'mdbtools')
source=(http://downloads.sourceforge.net/hk-classes/${pkgname}-${pkgver}.tar.bz2 ${pkgname}-${pkgver}-gcc-4.3.0.patch)
md5sums=('a61f0dc5a0ef2d4751c7330aacba8a65'
         '211b7f976f147c9c9731017a15346823')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 -i ../${pkgname}-${pkgver}-gcc-4.3.0.patch
#  libtoolize --force --copy
#  aclocal
#  autoconf
#  automake
  ./configure --prefix=/usr --without-paradox --without-xbase --enable-fast-install=no
  make || return 1
  make DESTDIR=$startdir/pkg install
}
