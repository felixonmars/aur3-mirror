# Maintainer: Nicolas Quiénot < niQo at aur >
# Contributor: Sebastien Binet <binet@farnsworth>
# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=libkqueue-svn 
_svnname=trunk
pkgver=652
pkgrel=1 
pkgdesc="libkqueue is a portable userspace implementation of the kqueue(2) kernel event notification mechanism"
url="http://mark.heily.com/libkqueue/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc' 'linux-api-headers')
makedepends=('gcc' 'subversion')
conflicts=('libkqueue')
provides=('libkqueue')
backup=()

source=('svn://svn.code.sf.net/p/libkqueue/code/trunk' 
        'libkqueue-license.txt')

md5sums=('SKIP'
         'e1feaa147250b1581d021efaebd55252')


pkgver() {
  cd $_svnname
  svnversion | tr -d [A-z]
}

build() {
  cd $_svnname
  CFLAGS='-fPIC -I./include -I./src/common -Wall -Werror' ./configure --prefix=/usr
  make

}

package() {
  cd $_svnname
  make DESTDIR="$pkgdir" install
  install -Dm644 $srcdir/libkqueue-license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
