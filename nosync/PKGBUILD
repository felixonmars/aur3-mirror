# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=nosync
pkgver=0.1
pkgrel=2
pkgdesc="library to disable sync/fsync/fdatasync"
arch=('i686' 'x86_64')
license=('GPL')
url="http://lj.rossia.org/users/igorpashev/26733.html#cutid1"
depends=('glibc')
source=(${pkgname}-${pkgver}.tar.bz2)
md5sums=('79804fa315bf45437edadfa3a54ecd7a')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  gcc -O2 -s -Wall -fPIC -shared -o libnosync.so libnosync.c	
  install -m644 -D libnosync.so $pkgdir/usr/lib/libnosync.so 
  install -m755 -D nosync $pkgdir/usr/bin/nosync 
}
