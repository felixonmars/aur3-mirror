pkgname=php-horde-idna
_hordename=Horde_Idna
pkgver=1.0.1
pkgrel=1
pkgdesc="Provide functionality useful for all kind of applications"
url="http://pear.horde.org/"
arch=('any')
depends=('php')
license=('LGPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('fc432437fde1f48ae7df124ffb64cbde')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
#  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}
