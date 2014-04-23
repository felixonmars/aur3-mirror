# Maintainer: Никола Вукосављевић <hauzer@gmx.com>

pkgname=usleep
pkgver=0.1
pkgrel=2
pkgdesc="A wrapper for usleep."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/usleep/"
license=('GPL3')
source=(http://sourceforge.net/projects/usleep/files/${pkgname}-${pkgver}.tar.gz)
sha512sums=('01080dac1d1d33bab3fa38c8102a9d8245decf18cdb149f612c37eb6f93b5171a500863bdf434b5de1279ac9e06ce3e7d2028b971ba42af5141275b58fc126e7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

