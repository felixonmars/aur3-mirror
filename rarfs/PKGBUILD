# Contributor: Jacques de Laval <jac.dl@gawab.com>
pkgname=rarfs
pkgver=0.1.0
_fullver="$pkgname-$pkgver"
pkgrel=1
pkgdesc="A Fuse module for mounting uncompressed Rar archives"
arch=('i686' 'x86_64')
url="http://rarfs.sourceforge.net/"
license=('GPL')
depends=(fuse gcc-libs)

# Standard Source Forge integration:
source+=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums+=(1e5d350d55c34f63b4b9170f4fc4ca3b1fe19a6f)
md5sums+=(35c602f180322ee6c543c4fdf32c8e84)

build() {
  cd "$srcdir/$_fullver"
  ./configure --prefix=/usr
  make
}

package() {
  make -C "$srcdir/$_fullver" DESTDIR="$pkgdir" install
}
