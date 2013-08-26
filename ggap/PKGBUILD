# Contributor: 

pkgname=ggap
pkgver=1.9.8
pkgrel=1
pkgdesc="GGAP is a frontend for GAP computer algebra system."
arch=('i686' 'x86_64')
url="http://ggap.sourceforge.net/"
license=('GPL')
depends=('zlib' 'gap-math' 'qt4')
makedepends=('cmake' 'gcc')
source=("http://citylan.dl.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('14fbe1328c0fd77c72c7802031658c97')

build() {
  cd "$pkgname-$pkgver"

  ./configure #--prefix=/usr PREFIX=/usr CC="$CC" CXX="$CXX"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
