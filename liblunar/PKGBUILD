# Maintainer: Corvolino <corvolino@archlinux.com.br>
# Contributor: yetist <yetist@gmail.com>

pkgname=liblunar
pkgver=2.2.5
pkgrel=1
pkgdesc="Chinese lunar library."
arch=("i686" "x86_64")
url="http://code.google.com/p/liblunar/"
license=('GPL2')
depends=('glib2>=2.12' 'intltool')
optdepends=('python: python binding')
source=("http://liblunar.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('e4b250378f06ec0d3fb39984048b48f9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}


