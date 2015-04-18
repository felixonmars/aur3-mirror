# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=php-horde-text_flowed
_hordename=Horde_Text_Flowed
pkgver=2.0.1
pkgrel=2
pkgdesc="Translation wrappers"
url="http://http://pear.horde.org/"
arch=('any')
license=('GPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('f59e7a5209fe110c245cf4a2fd478cd5')
depends=('php' 'php-horde-util')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}
