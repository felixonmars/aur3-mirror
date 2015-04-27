pkgname=zimlib
pkgver=1.2
pkgrel=1
pkgdesc='OpenZIM - libzim open standardized file format library'
arch=('x86_64' 'i686')
url='http://www.openzim.org/'
license=('GPLv2')
source=("${url}download/${pkgname}-${pkgver}.tar.gz")
md5sums=('1506bac0ee2f6ae645ed76b1bb5a93cb')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

