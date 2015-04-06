pkgname=snebu
pkgver=1.03
pkgrel=1
pkgdesc="A snapshot style multiple-client backup program"
url="http://www.snebu.com"
license=('GPLv3')
depends=('sqlite')
arch=('i686' 'x86_64')
source="https://github.com/derekp7/snebu/releases/download/v1.03/snebu-1.03.tar.gz"
md5sums=('ee65f360c92b831fc1ab9cd96d184fd9')
build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" BINDIR=/usr/bin
}
