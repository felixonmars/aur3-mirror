pkgname=('libmatrixstore')
pkgver=9160547
pkgrel=1 
pkgdesc='Simple matrix storage library. File-based, allows sharing among processes.'
arch=('any')
url='https://github.com/team-diana/libmatrixstore' 
license=('MIT')
depends=('')
makedepends=('git' 'make' 'dmd')
provides=('libmatrixstore')
conflicts=()
md5sums=('SKIP')
source=('git://github.com/team-diana/libmatrixstore')

pkgver() {
  cd "$srcdir/libmatrixstore"
  git describe --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/libmatrixstore"
  git checkout 83e18c9152c96f9a70c03c81a7dd962a36728424
	make 
}

package() {
	cd "$srcdir/libmatrixstore"
  mkdir -p "$pkgdir/usr/include"
  mkdir -p "$pkgdir/usr/lib"
	cp include/*.h "$pkgdir/usr/include/"
  cp libmatrixstore.so "$pkgdir/usr/lib/"
}
