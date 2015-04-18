# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=php-horde-stream
_hordename=Horde_Stream
pkgver=1.6.1
pkgrel=2
pkgdesc="An object-oriented interface to assist in creating and storing PHP stream resources, and to provide utility methods to access and manipulate the stream contents"
url="http://http://pear.horde.org/"
arch=('any')
license=('LGPL')
source=("http://pear.horde.org/get/${_hordename}-${pkgver}.tgz")
md5sums=('b7fe7a87e8234c749fe03bf420aa3992')
depends=('php' 'php-horde-exception')

package() {
  cd ${srcdir}/${_hordename}-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/share/pear/
  cp -r ./lib/* ${pkgdir}/usr/share/pear/
  cp -r ./test/* ${pkgdir}/usr/share/pear/test/
}
