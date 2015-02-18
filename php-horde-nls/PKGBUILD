pkgname=php-horde-nls
_hordename=Horde_Nls
pkgver=2.0.5
pkgrel=1
pkgdesc="Provide functionality useful for all kind of applications"
url="http://pear.horde.org/"
arch=('any')
depends=('php')
license=('LGPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('3f3786b8f9413df4d2a4afb86ac1c145')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
#  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}
