# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>
pkgname=vanessa_logger
pkgver=0.0.7
pkgrel=2
pkgdesc="Provides a generic logging layer that may be used to log to one or more of syslog, an open file handle or a file name."
url="http://www.vergenet.net/linux/vanessa/"
license="GPL"
makedepends=('automake' 'gcc' 'glibc' )
source=(http://www.vergenet.net/linux/vanessa/download/vanessa_logger/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('a3245db1a18169404affecc2422c64a6')
arch=('i686' 'x86_64')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=$startdir/pkg install

}
