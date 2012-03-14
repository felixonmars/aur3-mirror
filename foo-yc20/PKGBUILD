# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=foo-yc20
pkgver=1.3.0
pkgrel=1
pkgdesc="A divide-down combo organ designed in the late 60's."
arch=('i686' 'x86_64')
url="http://code.google.com/p/foo-yc20/"
license=('GPL')
depends=('jack' 'gtk2')
makedepends=('faust')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.bz2")
install="$pkgname.install"
md5sums=('3eddb658ddae87e3cf8e5ad7c4b6c8a6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir PREFIX=/usr install
}

