# Maintainer: Simon Gebert <simon at gebert dot eu>

pkgname=brother-dcp110c-cupswrapper
pkgver=1.0.2_3
pkgrel=1
pkgdesc="Official CUPS Drivers for Brother."
arch=('i686')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('GPL' 'custom:brother commercial license')
depends=('tcsh' 'brother-dcp110c-lpr' 'cups')
makedepends=('a2ps')
optdepends=('brscan2: scanner support for DCP110C')
install="brother-dcp110c-cupswrapper.install"
source=("http://www.brother.com/pub/bsc/linux/dlf/cupswrapperDCP110C-${pkgver/_/-}.i386.deb" ${pkgname}-${pkgver}.patch)
md5sums=('faf466db61daa75353b605d4b85f2ba5'
         '388f40d009155359f4c77f4a2c14b9b0')
build() {
  cd $srcdir || return 1
  tar xzvf data.tar.gz || return 1
  cd $srcdir/usr || return 1
  patch -Np1 -i $srcdir/${pkgname}-${pkgver}.patch || return 1
  mkdir -p $srcdir/opt/brother
  cp -R $srcdir/usr/local/Brother/* $srcdir/opt/brother
  rm -R $srcdir/usr/local
}
package() {
#  mkdir -p $pkgdir/usr
  mkdir -p $pkgdir/opt
#  cp -R $srcdir/usr/* $pkgdir/usr
  cp -R $srcdir/opt/* $pkgdir/opt
}
