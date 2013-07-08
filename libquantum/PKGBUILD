# Maintainer: Angus McInnes <angus@amcinnes.info>
# Contributor: Ashok `ScriptDevil` Gautham <ScriptDevil@gmail.com>

pkgname=libquantum
pkgver=1.1.1
pkgrel=1
pkgdesc="The C Library for quantum computing and quantum simulation"
arch=('i686' 'x86_64')
url="http://www.libquantum.de/"
license=('GPL3')
md5sums=('b2362b247c5b645bdca1075883072e19')

source=("http://www.libquantum.de/files/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
