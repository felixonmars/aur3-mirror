# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=php-horde-exception
_hordename=Horde_Exception
pkgver=2.0.4
pkgrel=2
pkgdesc="Provides the default exception handlers for the Horde Application Framework"
url="http://http://pear.horde.org/"
arch=('any')
license=('LPGL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('dcd84683bca18b61337d0e5eecafb7d0')
depends=('php' 'php-horde-translation')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}
