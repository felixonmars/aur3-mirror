# Contributor: figo.zhang <figo1802@gmail.com>

pkgname=evolution-statusicon
pkgver=1.0.4
pkgrel=3
pkgdesc="Have evolution live in the notification area."
url="http://blog.sukimashita.com/2009/01/30/put-evolution-into-the-tray-notification-area-using-evolution-statusicon/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('evolution' 'gnome-common')
makedepends=('subversion' 'pkgconfig' 'automake' 'autoconf' 'intltool')
options=('!libtool')
source=(evolution-statusicon-1.0.4.tar.bz2)
md5sums=('6ef6dd1e491b252686c10c70079f8338')

build() {
 	cd $startdir/src/$pkgname-$pkgver

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
