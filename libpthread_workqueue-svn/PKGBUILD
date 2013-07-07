# Contributor: Nicolas Quiénot < niQo at aur >
# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=libpthread_workqueue-svn 
_svnname=trunk
pkgver=281
pkgrel=1
pkgdesc="a portable implementation of the pthread_workqueue API first introduced in Mac OS X."
url="http://sourceforge.net/projects/libpwq/"
arch=('i686' 'x86_64')
license=('Apache')
depends=('glibc' 'libkqueue')
makedepends=('subversion' 'pkgconfig')
provides=('libpthread_workqueue')
source=('svn://svn.code.sf.net/p/libpwq/code/trunk' 'configure.patch')
md5sums=('SKIP' '101aae2422cdf7ebe1cdacddffc046d4')

pkgver() {
  cd $_svnname
  svnversion | tr -d [A-z]
}

build() {
  cd $_svnname

#  export CFLAGS="$CFLAGS -I/usr/include/kqueue/"
  ./configure --prefix=/usr

  make
}

package() {
  cd $_svnname
  make DESTDIR=$pkgdir install
}
