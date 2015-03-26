# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=qsimplesheet
pkgver=0.3.9
pkgrel=1
pkgdesc="A simple QT4 spreadsheet application"
arch=(i686 x86_64)
url="http://qt-apps.org/content/show.php/QSimpleSheet?content=75343"
license=('GPL2')
depends=('qt4')
makedepends=('cmake')
source=("http://qt-apps.org/CONTENT/content-files/75343-${pkgname}-${pkgver}.tar.gz")
md5sums=('36abdfca341a63b77484cb9b5ce9583e')

build() {
  mkdir "$pkgname-$pkgver/build"
  cd "$pkgname-$pkgver/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir" install
}
