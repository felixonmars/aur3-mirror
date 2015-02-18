pkgname=php-horde-text-filter
_hordename=Horde_Text_Filter
pkgver=2.2.2
pkgrel=1
pkgdesc="Provide functionality useful for all kind of applications"
url="http://pear.horde.org/"
arch=('any')
depends=('php')
license=('LGPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('c6a2e0d2d1c0cc0517be70fbc446e5b3')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}
