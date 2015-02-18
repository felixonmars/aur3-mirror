pkgname=php-horde-stream-wrapper
_hordename=Horde_Stream_Wrapper
pkgver=2.1.0
pkgrel=1
pkgdesc="Provide functionality useful for all kind of applications"
url="http://pear.horde.org/"
arch=('any')
depends=('php')
license=('LGPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('2fd063c1204e15dad6f5989f75d2e3e3')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}
