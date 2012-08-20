# Contributor: Jacques de Laval <jac.dl@gawab.com>
pkgname=rarfs
pkgver=0.1.1
_fullver="$pkgname-$pkgver"
pkgrel=1
pkgdesc="A Fuse module for mounting uncompressed Rar archives"
arch=('i686' 'x86_64')
url="http://rarfs.sourceforge.net/"
license=('GPL')
depends=(fuse gcc-libs)

# Standard Source Forge integration:
source+=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums+=(8634fb7d2112249fbcbc21cba8807fa60ec96a0b)
md5sums+=(5f5c9072012b88f2da5f844292cd9e43)

build() {
  cd "$srcdir/$_fullver"
  ./configure --prefix=/usr
  make
}

package() {
  make -C "$srcdir/$_fullver" DESTDIR="$pkgdir" install
}
