# Maintainer: Vincenzo Comito <clynamen@gmail.com>
pkgname=libmesasr
pkgver=1.0.14
pkgrel=1
pkgdesc="driver for mesa imaging ToF cameras"
arch=('i686' 'x86_64')
url="http://www.mesa-imaging.ch/support/driver-downloads/"
depends=()
license=('unknown')
 
case $CARCH in
'x86_64')
_debver=748
_arch='amd64'
md5sums=('30d2c3bd93402888e8f47b80a1008ed8')
;;
'i686')
_debver=741
_arch='i386'
md5sums=('c4ced3cc2d6628e92337ede1eec969b2')
;;
esac

# http://downloads.mesa-imaging.ch/dlm.php?fname=./customer/driver/libmesasr-dev-1.0.14-747.i386.deb 
# http://downloads.mesa-imaging.ch/dlm.php?fname=./customer/driver/libmesasr-dev-1.0.14-748.amd64.deb
 
source=("http://downloads.mesa-imaging.ch/dlm.php?fname=./customer/driver/libmesasr-dev-${pkgver}-${_debver}.${_arch}.deb")
 
package() {
tar -zxf data.tar.gz -C "${pkgdir}"
}
