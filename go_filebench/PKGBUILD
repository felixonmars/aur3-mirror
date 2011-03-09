# Maintainer: Brad Arrington <bradla8@yahoo.com>

pkgname=go_filebench
pkgver=1.4.8
pkgrel=1
pkgdesc="FileBench is a framework of file system workloads for measuring and comparing file system performance"
arch=(i686 x86_64)
url="http://www.fsl.cs.sunysb.edu/~vass/filebench/"
license=('CDDL')
depends=(perl libaio)
options=(docs)
install=
source=(http://www.fsl.cs.sunysb.edu/~vass/filebench/$pkgname-$pkgver.fsl.0.8.tar.gz)

md5sums=('43693c55266039f849897148c291472a')

build() {
  cd "$srcdir/$pkgname-$pkgver.fsl.0.8"
  
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
