# Italian localization for Calligra
# maintainer: Konstantin Krasavin <admin[at]polslinux[dot]it>
pkgname=('calligra-l10n-it')
pkgver=2.3.92
pkgrel=1
pkgdesc="Italian localization for Calligra"
arch=('any')
url="http://www.calligra-suite.org"
license=('LGPL')
makedepends=('cmake' 'automoc4' 'kdelibs' 'docbook-xsl')
source=(ftp://ftp.kde.org/pub/kde/unstable/calligra-${pkgver}/calligra-l10n/calligra-l10n-it-${pkgver}.tar.bz2)               
md5sums=('bc962a2172ffe383ccf6e819054883ad')

build() {
  cd $srcdir/$pkgname-$pkgver
  [[ -d build ]] && rm -r build
  mkdir build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    ..
  make
}
 
package() {
  cd $srcdir/$pkgname-$pkgver/build
  make DESTDIR=$pkgdir install
}
