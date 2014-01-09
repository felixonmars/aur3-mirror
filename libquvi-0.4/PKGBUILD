# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libquvi-0.4
pkgver=0.4.1
pkgrel=1
pkgdesc='Cross-platform library for parsing flash media stream URLs. (0.4.x. branch)'
arch=('i686' 'x86_64')
url='http://quvi.sourceforge.net/'
license=('LGPL')
depends=('libquvi-scripts-0.4' 'curl' 'lua')
conflicts=('quvi<0.4.0')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/quvi/libquvi-${pkgver}.tar.gz"{,.sig})
md5sums=('a5fa8860c23655a529b3166f6e25c83a'
         'cc7f15518f8ab2fc134bc64f0e9d584b')

prepare() {
  rm -fr build
  cp -R "libquvi-${pkgver}" build
}

build() {
  cd build
  ./configure --prefix=/usr --without-manual
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
