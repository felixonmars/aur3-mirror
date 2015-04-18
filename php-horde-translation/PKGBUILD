# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=php-horde-translation
_hordename=Horde_Translation
pkgver=2.1.0
pkgrel=2
pkgdesc="Translation wrappers"
url="http://http://pear.horde.org/"
arch=('any')
license=('GPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('20d904f7a7ed6b43ee0175f0a98363f9')
depends=('php')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}
