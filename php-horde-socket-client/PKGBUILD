pkgname=php-horde-socket-client
_hordename=Horde_Socket_Client
pkgver=1.1.2
pkgrel=1
pkgdesc="Provide functionality useful for all kind of applications"
url="http://pear.horde.org/"
arch=('any')
depends=('php')
license=('LGPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('1d85d99d8b152ae4a4c12e396b438d3d')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
#  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}
