# Contributor: Jacques de Laval <jac.dl@gawab.com>
pkgname=rarfs
pkgver=0.0.10
_fullver="$pkgname-$pkgver"
pkgrel=1
pkgdesc="A Fuse module for mounting uncompressed Rar archives"
arch=('i686' 'x86_64')
url="http://rarfs.sourceforge.net/"
license=('GPL')
depends=(fuse gcc-libs)
source=("$_fullver.tar.gz::http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$_fullver.tar.gz/download")
md5sums=(b708df36a7ac276a5189083ba003d37c)

build() {
  cd "$srcdir/$_fullver"
  ./configure --prefix=/usr
  make || return 1
}

package() {
  make -C "$srcdir/$_fullver" DESTDIR="$pkgdir" install
}
