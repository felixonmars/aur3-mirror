# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=gmock-make
pkgver=1.7.0
pkgrel=1
pkgdesc="Installs the gmock CMakeLists.txt file to the /usr/src/gmock directory."
arch=('any')
url="http://code.google.com/p/googlemock/"
license=('BSD')
depends=('gmock')
source=("http://googlemock.googlecode.com/files/gmock-${pkgver}.zip")
sha512sums=('0ab7bb2614f8c00e4842a6819dbc6d9323c42241335078c23eaee53ed420d42f1845d44334eccbf7c114cc88f6ac7a493e20d9b46c58cdba645bbd400eb6db55')

package () {
  mkdir -p $pkgdir/usr/src/gmock
  cp $srcdir/gmock-$pkgver/CMakeLists.txt $pkgdir/usr/src/gmock
}

