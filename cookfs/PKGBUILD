pkgname=cookfs
pkgver=1.4
pkgrel=1
pkgdesc="cookfs file system"
arch=('i686' 'x86_64')
url="http://www.endorser.org/en/blog/tcl/cookfs"
license=('custom')
depends=(tcl)
makedepends=(tcl)
source=(https://github.com/l3iggs/cookfs/archive/$pkgver.tar.gz)
noextract=()
md5sums=('c1f8d6058f4ad46e3615101e7a251131')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
